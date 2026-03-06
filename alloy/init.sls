# Software Definition File for Grafana Alloy

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% load_yaml as versions -%}
# renovate: datasource=github-releases depName=alloy packageName=grafana/alloy
- 'v1.13.2'
- 'v1.13.1'
- 'v1.13.0'
- 'v1.12.2'
- 'v1.12.1'
- 'v1.12.0'
- 'v1.11.3'
- 'v1.11.2'
- 'v1.11.0'
- 'v1.10.2'
- 'v1.10.1'
- 'v1.10.0'
- 'v1.9.2'
- 'v1.9.1'
- 'v1.8.2'
- 'v1.8.1' 
- 'v1.8.1' 
- 'v1.8.0' 
- 'v1.7.5' 
- 'v1.7.4' 
- 'v1.7.3' 
- 'v1.7.2' 
- 'v1.7.1' 
- 'v1.7.0' 
- 'v1.6.1' 
- 'v1.6.0' 
{% endload -%}

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
