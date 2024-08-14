owncloud:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  {% for version in '2.2.4.6408', '2.2.2.6192', '2.2.1.6146', '2.2.0.6076', '2.1.1.5837' %}
  '{{ version }}':
    full_name: 'ownCloud'
    installer: 'https://download.owncloud.com/desktop/stable/ownCloud-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\ownCloud\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
