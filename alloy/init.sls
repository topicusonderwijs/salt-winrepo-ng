# Software Definition File for Grafana Alloy

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = [
  'v1.2.0', 'v1.2.1', 
  'v1.3.0', 'v1.3.1', 'v1.3.2', 'v1.3.3', 'v.1.3.4', 
  'v1.4.0', 'v1.4.1', 'v1.4.2', 'v1.4.3', 
  'v.1.5.0', 'v1.5.1', 
  'v1.6.0', 'v1.6.1',
  'v1.7.0', 'v1.7.1', 'v1.7.2', 'v1.7.3', 'v1.7.4', 'v1.7.5',
  'v1.8.0', 'v1.8.1', 'v1.8.1', 'v1.8.2', 'v1.8.3'] %}

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
    install_flags: 'v1.3.1'
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/alloy/remove.cmd'
    cache_dir: True
