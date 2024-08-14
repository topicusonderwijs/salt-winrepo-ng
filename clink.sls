# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
clink:
  '0.4.8':
    full_name: 'Clink v0.4.8'
    installer: 'https://github.com/mridgers/clink/releases/download/0.4.8/clink_0.4.8_setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\clink\0.4.8\clink_uninstall_0.4.8.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '0.4.7':
    full_name: 'Clink v0.4.7'
    installer: 'https://github.com/mridgers/clink/releases/download/0.4.7/clink_0.4.7_setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\clink\0.4.7\clink_uninstall_0.4.7.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '0.4.6':
    full_name: 'Clink v0.4.6'
    installer: 'https://github.com/mridgers/clink/releases/download/0.4.6/clink_0.4.6_setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\clink\0.4.6\clink_uninstall_0.4.6.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '0.4.4':
    full_name: 'Clink v0.4.4'
    installer: 'https://github.com/mridgers/clink/releases/download/0.4.4/clink_0.4.4_setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\clink\0.4.4\clink_uninstall_0.4.4.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
# https://mridgers.github.io/clink/
