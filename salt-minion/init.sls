# Software Definition File for Grafana Alloy

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% load_yaml as versions -%}
- 3006.23
{% endload -%}

{% set latest = versions|first %}

salt-minion:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Alloy'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/salt-minion/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/salt-minion/remove.cmd'
    cache_dir: True
{% endfor %}
