# Script to download, unzip, and setup Grafana Alloy
# Called by install.cmd

# Load parameters
param(
    [Parameter(Mandatory=$True)]
    [String] $version
)
# Get the directory this script is running under
$script_path = dir "$($myInvocation.MyCommand.Definition)"
$script_path = $script_path.DirectoryName

# Define variables
$base_url="https://github.com/grafana/alloy/releases/download/$version"
$filename = "alloy-installer-windows-amd64.exe.zip"
$url = "$base_url/$filename"
$zip_file = "$script_path\$filename"
$date = Get-Date -Format "yyyyMMdd"

# Download the file
# Powershell supports only TLS 1.0 by default. Add support up to TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $zip_file)

# Unzip the file to current location
$ProgressPreference = "SilentlyContinue"

# Remove existing temp directory if present
if ( Test-Path -Path "$env:TEMP\salt-alloy" ) {
    Remove-Item -Path "$env:TEMP\salt-alloy" -Recurse -Force
}
New-Item -Path "$env:TEMP\salt-alloy" -Type Directory | Out-Null

Get-ChildItem $zip_file | Expand-Archive -DestinationPath "$env:TEMP\salt-alloy" -Force

& "$env:TEMP\salt-alloy\alloy-installer-windows-amd64.exe" /S /DISABLEREPORTING=yes | Out-Null

$RegistryPath = "HKLM:\Software\GrafanaLabs\Alloy"

$RegistryValue = @('run', 'C:\Program Files\GrafanaLabs\Alloy\config.alloy', '--storage.path=C:\ProgramData\GrafanaLabs\Alloy\data', '--disable-reporting', '--server.http.listen-addr=0.0.0.0:12345')

Set-ItemProperty -Path $RegistryPath -Name "Arguments" -Value $RegistryValue

Restart-Service -Name Alloy

# Calculate installation size
$size = (Get-ChildItem "$env:ProgramFiles\GrafanaLabs\Alloy" | Measure Length -Sum).Sum /1KB

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "Alloy" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Alloy" -Name "DisplayName" -Value "Alloy" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Alloy" -Name "DisplayVersion" -Value "$version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Alloy" -Name "UninstallString" -Value "Managed by Salt" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Alloy" -Name "Publisher" -Value "Grafana Labs" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Alloy" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Alloy" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null