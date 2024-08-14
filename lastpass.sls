# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
lastpass:
  'Not Found':
    full_name: 'LastPass (uninstall only)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.cloud.lastpass.com/windows_installer/lastpass_x64.exe'
    {% else %}
    installer: 'https://download.cloud.lastpass.com/windows_installer/lastpass.exe'
    {% endif %}
    install_flags: '-si --userinstallie --userinstallff --userinstallchrome'
    uninstaller: '{{ PROGRAM_FILES }}\LastPass\lastpass.exe'
    uninstall_flags: '-sb'
    msiexec: False
    locale: en_US
    reboot: False
