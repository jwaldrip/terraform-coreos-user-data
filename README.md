# Terraform CoreOS UserData for CloudConfig
A terraform module that allows for configuration for CoreOS using terraform
variables. The result will be an output containing the user-data for use in
provisioning instances with any provider. In addition, the package also
validates the outputted user-data using a service hosted by the CoreOS team.

## Usage

### Basic Overview

### Outputs

* `module.user-data` => user-data as a string
* `module.user-data-base64` => base64 encoded user-data

### Variables
The following variables can be used to configure the user data.

#### Etcd2
enable_etcd2 = "true"
etcd2_advertise-client-urls = ""
etcd2_cert-file = ""
etcd2_client-cert-auth = ""
etcd2_cors = ""
etcd2_data-dir = ""
etcd2_debug = ""
etcd2_discovery = ""
etcd2_discovery-fallback = ""
etcd2_discovery-proxy = ""
etcd2_discovery-srv = ""
etcd2_election-timeout = ""
etcd2_heartbeat-interval = ""
etcd2_initial-advertise-peer-urls = ""
etcd2_initial-cluster = ""
etcd2_initial-cluster-state = ""
etcd2_initial-cluster-token = ""
etcd2_key-file = ""
etcd2_listen-client-urls = ""
etcd2_listen-peer-urls = ""
etcd2_log-package-levels = ""
etcd2_max-snapshots = ""
etcd2_max-wals = ""
etcd2_name = ""
etcd2_peer-cert-file = ""
etcd2_peer-client-cert-auth = ""
etcd2_peer-key-file = ""
etcd2_peer-trusted-ca-file = ""
etcd2_proxy = ""
etcd2_proxy-dial-timeout = ""
etcd2_proxy-failure-wait = ""
etcd2_proxy-read-timeout = ""
etcd2_proxy-refresh-interval = ""
etcd2_proxy-write-timeout = ""
etcd2_snapshot-count = ""
etcd2_trusted-ca-file = ""

#### Fleet
enable_fleet = "true"
fleet_agent_ttl = ""
fleet_disable_engine = ""
fleet_disable_watches = ""
fleet_engine_reconcile_interval = ""
fleet_etcd_certfile = ""
fleet_etcd_key_prefix = ""
fleet_etcd_keyfile = ""
fleet_etcd_request_timeout = ""
fleet_etcd_servers = ""
fleet_metadata = ""
fleet_public_ip = ""
fleet_token_limit = ""
fleet_verbosity = ""

#### Flannel
enable_flannel = "true"
flannel_etcd-certfile = ""
flannel_etcd-endpoints = ""
flannel_etcd-keyfile = ""
flannel_etcd-prefix = ""
flannel_interface = ""
flannel_ip-masq = ""

#### Locksmith
enable_locksmith = "true"
locksmith_endpoint = ""
locksmith_etcd-certfile = ""
locksmith_etcd-keyfile = ""
locksmith_group = ""

#### Update Service
enable_update = "true"
update_group = "stable"
update_reboot-strategy = "best-effort"
update_server = ""

#### Basic Configuration
hostname = ""
manage_etc_hosts = ""
ssh_authorized_keys = ""
units = ""
users = ""
write_files = ""
