# Terraform CoreOS UserData for CloudConfig
![](https://img.shields.io/badge/licence-MIT-blue.svg) [![Build Status](https://travis-ci.org/jwaldrip/terraform-coreos-user-data.svg?branch=master)](https://travis-ci.org/jwaldrip/terraform-coreos-user-data)

Terraform module that allows for configuration for CoreOS using terraform
variables. The result will be an output containing the user-data for use in
provisioning instances with any provider. In addition, the package also
validates the outputted user-data using a service hosted by the CoreOS team.

## Usage

### Basic Overview
To use the module, include it in your project and assign the variables. You can
then use the output to gather the user-data file.

```hcl
module "coreos-config" {
  source = "github.com/jwaldrip/terraform-coreos-user-data"
  var_1 = "value"
}

resource "aws_instance" "web" {
  ami = "ami-408c7f28"
  instance_type = "t1.micro"
  user_data = "${module.coreos-config.user-data}"
}
```

### Systemd Variable Interpolation
Terraform has an issue with interpolation of `$`. In order to get around that we do dynamic replacement of `var!` and replace it with `$`.  

##### Example:
`$public_ipv4` would be written as `var!public_ipv4`.

### Outputs
name                      | description
--------------------------|----------------------------
`module.user-data`        | user-data string

### Variables
The following variables can be used to configure the user data.

#### Basic Configuration
name                                | default                 | description
------------------------------------|-------------------------|------------
hostname                            | *none*                      | A custom hostname for the instance
manage_etc_hosts                    | *none*                      | A string representing the etc hosts.
ssh_authorized_keys                 | *none*                      | A YAML file containing an array of keys
units                               | *none*                      | A YAML file containing an array of units
users                               | *none*                      | A YAML file containing an array of users
write_files                         | *none*                      | A YAML file containing an array of files

#### Etcd2
name                                | default                 | description
------------------------------------|-------------------------|------------
enable_etcd2                        | `true`                  | Enable ETCD

##### Member Flags
name                                | default                 | description
------------------------------------|-------------------------|------------
etcd2_cors                          | *none*                      | Comma-separated white list of origins for CORS (cross-origin resource sharing).
etcd2_data-dir                      | `${name}.etcd`          | Path to the data directory.
etcd2_election-timeout              | `1000`                  | Time (in milliseconds) for an election to timeout.
etcd2_heartbeat-interval            | `100`                   | Time (in milliseconds) of a heartbeat interval.
etcd2_listen-client-urls            | `http://localhost:2379,http://localhost:4001` | List of URLs to listen on for client traffic. This flag tells the etcd to accept incoming requests from the clients on the specified scheme://IP:port combinations. Scheme can be either http or https. If 0.0.0.0 is specified as the IP, etcd listens to the given port on all interfaces. If an IP address is given as well as a port, etcd will listen on the given port and interface. Multiple URLs may be used to specify a number of addresses and ports to listen on. The etcd will respond to requests from any of the listed addresses and ports.
etcd2_listen-peer-urls              | `http://localhost:2380,http://localhost:7001` | List of URLs to listen on for peer traffic. This flag tells the etcd to accept incoming requests from its peers on the specified scheme://IP:port combinations. Scheme can be either http or https.If 0.0.0.0 is specified as the IP, etcd listens to the given port on all interfaces. If an IP address is given as well as a port, etcd will listen on the given port and interface. Multiple URLs may be used to specify a number of addresses and ports to listen on. The etcd will respond to requests from any of the listed addresses and ports.
etcd2_max-snapshots                 | `5`                     | Maximum number of snapshot files to retain (0 is unlimited).
etcd2_max-wals                      | `5`                     | Maximum number of wal files to retain (0 is unlimited).
etcd2_name                          | `default`               | Human-readable name for this member.
etcd2_snapshot-count                | `10000`                 | Number of committed transactions to trigger a snapshot to disk.

##### Clustering Flags
`etcd2_initial` prefix flags are used in bootstrapping (static bootstrap, discovery-service bootstrap or runtime reconfiguration) a new member, and ignored when restarting an existing member.

`etcd2_discovery` prefix flags need to be set when using discovery service.

name                                | default                 | description
------------------------------------|-------------------------|------------
etcd2_advertise-client-urls         | `http://localhost:2379,http://localhost:4001` | List of this member’s client URLs to advertise to the rest of the cluster. These URLs can contain domain names.
etcd2_discovery                     | *none*                      | Discovery URL used to bootstrap the cluster.
etcd2_discovery-fallback            | *none*                      | Expected behavior (“exit” or “proxy”) when discovery services fails.
etcd2_discovery-proxy               | *none*                      | HTTP proxy to use for traffic to discovery service.
etcd2_discovery-srv                 | *none*                      | DNS SRV domain used to bootstrap the cluster.
etcd2_initial-advertise-peer-url    | `http://localhost:2380,http://localhost:7001` | List of this member’s peer URLs to advertise to the rest of the cluster. These addresses are used for communicating etcd data around the cluster. At least one must be routable to all cluster members. These URLs can contain domain names.
etcd2_initial-cluster               | `default=http://localhost:2380,default=http://localhost:7001` | Initial cluster configuration for bootstrapping.
etcd2_initial-cluster-state         | `new`                   | Initial cluster state (“new” or “existing”). Set to new for all members present during initial static or DNS bootstrapping. If this option is set to existing, etcd will attempt to join the existing cluster. If the wrong value is set, etcd will attempt to start but fail safely.
etcd2_initial-cluster-token         | `etcd-cluster`          | Initial cluster token for the etcd cluster during bootstrap.

##### Proxy Flags
`etcd2_proxy` prefix flags configures etcd to run in proxy mode.

name                                | default                 | description
------------------------------------|-------------------------|------------
etcd2_proxy                         | `off`                   | Proxy mode setting (“off”, “readonly” or “on”).
etcd2_proxy-dial-timeout            | `1000`                  | Time (in milliseconds) for a dial to timeout or 0 to disable the timeout.
etcd2_proxy-failure-wait            | `5000`                  | Time (in milliseconds) an endpoint will be held in a failed state before being reconsidered for proxied requests.
etcd2_proxy-read-timeout            | `0`                     | Time (in milliseconds) for a read to timeout or 0 to disable the timeout
etcd2_proxy-refresh-interval        | `30000`                 | Time (in milliseconds) of the endpoints refresh interval.
etcd2_proxy-write-timeout           | `5000`                  | Time (in milliseconds) for a write to timeout or 0 to disable the timeout.

##### Security Flags

The security flags help to build a secure etcd cluster.

name                                | default                 | description
------------------------------------|-------------------------|------------
etcd2_cert-file                     | *none*                      | Path to the client server TLS cert file.
etcd2_client-cert-auth              | `false`                 | Enable client cert authentication.
etcd2_key-file                      | *none*                      | Path to the client server TLS key file.
etcd2_peer-cert-file                | *none*                      | Path to the peer server TLS cert file.
etcd2_peer-client-cert-auth         | `false`                 | Enable peer client cert authentication.
etcd2_peer-key-file                 | *none*                      | Path to the peer server TLS key file.
etcd2_peer-trusted-ca-file          | *none*                      | Path to the peer server TLS trusted CA file.
etcd2_trusted-ca-file               | *none*                      | Path to the client server TLS trusted CA key file.

##### Logging Flags

name                                | default                 | description
------------------------------------|-------------------------|------------
etcd2_debug                         | `false`                 | Drop the default log level to DEBUG for all subpackages.
etcd2_log-package-levels            | *none*                      | Set individual etcd subpackages to specific log levels. <br/> ex: `"etcdserver=WARNING,security=DEBUG"`

#### Fleet
name                                | default       | description
------------------------------------|---------------|------------
enable_fleet                        | `true`        | Enable Fleet
fleet_agent_ttl                     | `30s`         | An Agent will be considered dead if it exceeds this amount of time to communicate with the Registry. The agent will attempt a heartbeat at half of this value.
fleet_engine_reconcile_interval     | `2`           | Interval in seconds at which the engine should reconcile the cluster schedule in etcd.
fleet_etcd_certfile                 | *none*            | Provide TLS configuration when SSL certificate authentication is enabled in etcd endpoints.
fleet_etcd_key_prefix               | `/\_coreos.com/fleet/` | Keyspace path for fleet data in etcd.
fleet_etcd_keyfile                  | *none*            | Provide TLS configuration when SSL certificate authentication is enabled in etcd endpoints.
fleet_etcd_request_timeout          | `1.0`         | Amount of time in seconds to allow a single etcd request before considering it failed.
fleet_etcd_servers                  | `http://127.0.0.1:2379,http://127.0.0.1:4001` | Provide a custom set of etcd endpoints.
fleet_metadata                      | *none*            | Comma-delimited key/value pairs that are published with the local to the fleet registry. This data can be used directly by a client of fleet to make scheduling decisions. <br /> ex: `"region=us-west,az=us-west-1"`
fleet_public_ip                     | *none*            | IP address that should be published with the local Machine's state and any socket information. If not set, fleetd will attempt to detect the IP it should publish based on the machine's IP routing information.
fleet_token_limit                   | `100`         | Maximum number of entries per page returned from API requests.
fleet_verbosity                     | `0`           | Enable debug logging by setting this to an integer value greater than zero. Only a single debug level exists, so all values greater than zero are considered equivalent.

#### Flannel
name                                | default       | description
------------------------------------|---------------|------------
enable_flannel                      | `true`        | Enable flannel
flannel_config                      | `{ \"Network\": \"10.1.0.0/16\" }` | Configuration for flannel
flannel_etcd-certfile               | *none*            | Path to certificate file used for TLS communication with etcd.
flannel_etcd-endpoints              | `http://127.0.0.1:2379,http://127.0.0.1:4001` | Provide a custom set of etcd endpoints.
flannel_etcd-keyfile                | *none*            | Path to private key file used for TLS communication with etcd.
flannel_etcd-prefix                 | `/coreos.com/network` | etcd prefix path to be used for flannel keys.
flannel_interface                   | *none*            | Interface (name or IP) that should be used for inter-host communication.
flannel_ip-masq                     | *none*            | Install IP masquerade rules for traffic outside of flannel subnet.
flannel_public-ip                   | *none*            | IP accessible by other nodes for inter-host communication
flannel_subnet-file                 | `/run/flannel/subnet.env` | filename where env variables (subnet and MTU values) will be written to.

#### Locksmith
name                                | default       | description
------------------------------------|---------------|------------
locksmith_endpoint                  | `http://127.0.0.1:2379,http://127.0.0.1:4001` | Provide a custom set of etcd endpoints.
locksmith_etcd-certfile             | *none*            | Provide TLS configuration when SSL certificate authentication is enabled in etcd endpoints.
locksmith_etcd-keyfile              | *none*            | Provide TLS configuration when SSL certificate authentication is enabled in etcd endpoints.
locksmith_group                     | `default`     | The groupname to check locks against.

#### Update Service
name                                | default       | description
------------------------------------|---------------|------------
enable_update                       | `true`        | Enable Update Service
update_group                        | `stable`      | signifies the channel which should be used for automatic updates. This value defaults to the version of the image initially downloaded. (one of “master”, “alpha”, “beta”, “stable”)
update_reboot-strategy              | `best-effort` | One of “reboot”, “etcd-lock”, “best-effort” or “off” for controlling when reboots are issued after an update is performed.<ul><li>reboot: Reboot immediately after an update is applied.<li>etcd-lock: Reboot after first taking a distributed lock in etcd, this guarantees that only one host will reboot concurrently and that the cluster will remain available during the update.<li>best-effort - If etcd is running, “etcd-lock”, otherwise simply “reboot”.<li>off - Disable rebooting after updates are applied (not recommended).</ul>
update_server                       | *none*            | The location of the CoreUpdate server which will be queried for updates. Also known as the omaha server endpoint.
