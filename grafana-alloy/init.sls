# Software Definition File for Elasticsearch Packetbeat

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = ['v1.3.0'] %}

packetbeat:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Packetbeat'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/_/grafana-alloy/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/_/grafana-alloy/remove.cmd'
    cache_dir: True
{% endfor %}
