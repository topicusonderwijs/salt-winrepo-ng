# Software Definition File for Grafana Alloy

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% import_yaml "versions.yaml" as versions %}

{% set latest = versions|first %}

alloy:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Grafana Alloy'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/alloy/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/alloy/remove.cmd'
    cache_dir: True
{% endfor %}
  latest:
    full_name: 'Grafana Alloy'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/alloy/install.cmd'
    install_flags: {{ latest }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/alloy/remove.cmd'
    cache_dir: True
