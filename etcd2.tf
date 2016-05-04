# etcd2 Configuration
# Enable/Disable etcd2, when false, the remaining config options have no affect.
variable "enable_etcd2" {
  default = "true"
}

# Member Flags

# ============

# –name
# Human-readable name for this member.
# default: “default”
# This value is referenced as this node’s own entries listed in the
# --initial-cluster flag (Ex: default=http://localhost:2380 or
# default=http://localhost:2380,default=http://localhost:7001). This needs to
# match the key used in the flag if you’re using static bootstrapping. When
# using discovery, each member must have a unique name. Hostname or machine-id
# can be a good choice.
variable "etcd2_name" {
  default = ""
}

# --data-dir
# Path to the data directory.
# default: “${name}.etcd”
variable "etcd2_data-dir" {
  default = ""
}

# --snapshot-count
# Number of committed transactions to trigger a snapshot to disk.
# default: “10000”
variable "etcd2_snapshot-count" {
  default = ""
}

# --heartbeat-interval
# Time (in milliseconds) of a heartbeat interval.
# default: “100”
variable "etcd2_heartbeat-interval" {
  default = ""
}

# --election-timeout
# Time (in milliseconds) for an election to timeout. See Documentation/tuning.md
# for details.
# default: “1000”
variable "etcd2_election-timeout" {
  default = ""
}

# --listen-peer-urls
# List of URLs to listen on for peer traffic. This flag tells the etcd to accept
# incoming requests from its peers on the specified scheme://IP:port
# combinations. Scheme can be either http or https.If 0.0.0.0 is specified as
# the IP, etcd listens to the given port on all interfaces. If an IP address is
# given as well as a port, etcd will listen on the given port and interface.
# Multiple URLs may be used to specify a number of addresses and ports to listen
# on. The etcd will respond to requests from any of the listed addresses and
# ports.
# default: “http://localhost:2380,http://localhost:7001”
# example: “http://10.0.0.1:2380”
# invalid example: “http://example.com:2380” (domain is invalid for binding)
variable "etcd2_listen-peer-urls" {
  default = ""
}

# --listen-client-urls
# List of URLs to listen on for client traffic. This flag tells the etcd to
# accept incoming requests from the clients on the specified scheme://IP:port
# combinations. Scheme can be either http or https. If 0.0.0.0 is specified as
# the IP, etcd listens to the given port on all interfaces. If an IP address is
# given as well as a port, etcd will listen on the given port and interface.
# Multiple URLs may be used to specify a number of addresses and ports to listen
# on. The etcd will respond to requests from any of the listed addresses and
# ports.
# default: “http://localhost:2379,http://localhost:4001”
# example: “http://10.0.0.1:2379”
# invalid example: “http://example.com:2379”
variable "etcd2_listen-client-urls" {
  default = ""
}

# --max-snapshots
# Maximum number of snapshot files to retain (0 is unlimited)
# default: 5
# The default for users on Windows is unlimited, and manual purging down to 5
# (or your preference for safety) is recommended.
variable "etcd2_max-snapshots" {
  default = ""
}

# --max-wals
# Maximum number of wal files to retain (0 is unlimited)
# default: 5
# The default for users on Windows is unlimited, and manual purging down to 5
# (or your preference for safety) is recommended.
variable "etcd2_max-wals" {
  default = ""
}

# --cors
# Comma-separated white list of origins for CORS (cross-origin resource sharing).
# default: none
variable "etcd2_cors" {
  default = ""
}

# Clustering Flags

# ================

# * --initial prefix flags are used in bootstrapping (static bootstrap,

# discovery-service bootstrap or runtime reconfiguration) a new member, and

# ignored when restarting an existing member.

#

# * --discovery prefix flags need to be set when using discovery service.

# --initial-advertise-peer-urls
# List of this member’s peer URLs to advertise to the rest of the cluster. These
# addresses are used for communicating etcd data around the cluster. At least
# one must be routable to all cluster members. These URLs can contain
# domain names.
# default: “http://localhost:2380,http://localhost:7001”
# example: “http://example.com:2380, http://10.0.0.1:2380”
variable "etcd2_initial-advertise-peer-urls" {
  default = ""
}

# --initial-cluster
# Initial cluster configuration for bootstrapping.
# default: “default=http://localhost:2380,default=http://localhost:7001”
# The key is the value of the --name flag for each node provided. The default
# uses default for the key because this is the default for the --name flag.
variable "etcd2_initial-cluster" {
  default = ""
}

# --initial-cluster-state
# Initial cluster state (“new” or “existing”). Set to new for all members
# present during initial static or DNS bootstrapping. If this option is set to
# existing, etcd will attempt to join the existing cluster. If the wrong value
# is set, etcd will attempt to start but fail safely.
# default: “new”
variable "etcd2_initial-cluster-state" {
  default = ""
}

# --initial-cluster-token
# Initial cluster token for the etcd cluster during bootstrap.
# default: “etcd-cluster”
variable "etcd2_initial-cluster-token" {
  default = ""
}

# --advertise-client-urls
# List of this member’s client URLs to advertise to the rest of the cluster.
# These URLs can contain domain names.
# default: “http://localhost:2379,http://localhost:4001”
# example: “http://example.com:2379, http://10.0.0.1:2379”
# Be careful if you are advertising URLs such as http://localhost:2379 from a
# cluster member and are using the proxy feature of etcd. This will cause loops,
# because the proxy will be forwarding requests to itself until its resources
# (memory, file descriptors) are eventually depleted.
variable "etcd2_advertise-client-urls" {
  default = ""
}

# --discovery
# Discovery URL used to bootstrap the cluster.
# default: none
variable "etcd2_discovery" {
  default = ""
}

# --discovery-srv
# DNS srv domain used to bootstrap the cluster.
# default: none
variable "etcd2_discovery-srv" {
  default = ""
}

# --discovery-fallback
# Expected behavior (“exit” or “proxy”) when discovery services fails.
# default: “proxy”
variable "etcd2_discovery-fallback" {
  default = ""
}

# --discovery-proxy
# HTTP proxy to use for traffic to discovery service.
# default: none
variable "etcd2_discovery-proxy" {
  default = ""
}

# Proxy Flags
# ===========
# --proxy prefix flags configures etcd to run in proxy mode.
variable "etcd2_proxy" {
  default = ""
}

# --proxy-failure-wait
# Time (in milliseconds) an endpoint will be held in a failed state before being
# reconsidered for proxied requests.
# default: 5000
variable "etcd2_proxy-failure-wait" {
  default = ""
}

# --proxy-refresh-interval
# Time (in milliseconds) of the endpoints refresh interval.
# default: 30000
variable "etcd2_proxy-refresh-interval" {
  default = ""
}

# --proxy-dial-timeout
# Time (in milliseconds) for a dial to timeout or 0 to disable the timeout
# default: 1000
variable "etcd2_proxy-dial-timeout" {
  default = ""
}

# --proxy-write-timeout
# Time (in milliseconds) for a write to timeout or 0 to disable the timeout.
# default: 5000
variable "etcd2_proxy-write-timeout" {
  default = ""
}

# proxy-read-timeout
# Time (in milliseconds) for a read to timeout or 0 to disable the timeout.
# Don’t change this value if you use watches because they are using long polling
# requests.
# default: 0
variable "etcd2_proxy-read-timeout" {
  default = ""
}

# Security Flags

# ==============

# The security flags help to build a secure etcd cluster.

# --cert-file
# Path to the client server TLS cert file.
# default: none
variable "etcd2_cert-file" {
  default = ""
}

# --key-file
# Path to the client server TLS key file.
# default: none
variable "etcd2_key-file" {
  default = ""
}

# --client-cert-auth
# Enable client cert authentication.
# default: false
variable "etcd2_client-cert-auth" {
  default = ""
}

# --trusted-ca-file
# Path to the client server TLS trusted CA key file.
# default: none
variable "etcd2_trusted-ca-file" {
  default = ""
}

# --peer-cert-file
# Path to the peer server TLS cert file.
# default: none
variable "etcd2_peer-cert-file" {
  default = ""
}

# --peer-key-file
# Path to the peer server TLS key file.
# default: none
variable "etcd2_peer-key-file" {
  default = ""
}

# --peer-client-cert-auth
# Enable peer client cert authentication.
# default: false
variable "etcd2_peer-client-cert-auth" {
  default = ""
}

# --peer-trusted-ca-file
# Path to the peer server TLS trusted CA file.
# default: none
variable "etcd2_peer-trusted-ca-file" {
  default = ""
}

# Logging Flags

# =============

# --debug
# Drop the default log level to DEBUG for all subpackages.
# default: false (INFO for all packages)
variable "etcd2_debug" {
  default = ""
}

# --log-package-levels
# Set individual etcd subpackages to specific log levels. An example being
# etcdserver=WARNING,security=DEBUG
# default: none (INFO for all packages)
variable "etcd2_log-package-levels" {
  default = ""
}

// Unit file for etcd2
resource "template_file" "etcd2_unit" {
  template = "${file("${path.module}/templates/enabled-unit.yml")}"

  vars {
    service = "etcd2"
    enabled = "${var.enable_etcd2}"
  }
}

resource "template_file" "etcd2" {
  template = "${file("${path.module}/templates/etcd2.yml")}"

  provisioner "local-exec" {
    command = "cat <<'__USERDATA__' > /dev/null\n${replace(replace(template_file.etcd2.rendered, "var!", "$"), "/\n\\s+\n/", "\n")}\n__USERDATA__"
  }

  vars {
    name                        = "${var.etcd2_name}"
    data-dir                    = "${var.etcd2_data-dir}"
    snapshot-count              = "${var.etcd2_snapshot-count}"
    heartbeat-interval           = "${var.etcd2_heartbeat-interval}"
    election-timeout            = "${var.etcd2_election-timeout}"
    listen-peer-urls            = "${var.etcd2_listen-peer-urls}"
    listen-client-urls          = "${var.etcd2_listen-client-urls}"
    max-snapshots               = "${var.etcd2_max-snapshots}"
    max-wals                    = "${var.etcd2_max-wals}"
    cors                        = "${var.etcd2_cors}"
    initial-advertise-peer-urls = "${var.etcd2_initial-advertise-peer-urls}"
    initial-cluster             = "${var.etcd2_initial-cluster}"
    initial-cluster-state       = "${var.etcd2_initial-cluster-state}"
    initial-cluster-token       = "${var.etcd2_initial-cluster-token}"
    advertise-client-urls       = "${var.etcd2_advertise-client-urls}"
    discovery                   = "${var.etcd2_discovery}"
    discovery-srv               = "${var.etcd2_discovery-srv}"
    discovery-fallback          = "${var.etcd2_discovery-fallback}"
    discovery-proxy             = "${var.etcd2_discovery-proxy}"
    proxy                       = "${var.etcd2_proxy}"
    proxy-failure-wait          = "${var.etcd2_proxy-failure-wait}"
    proxy-refresh-interval      = "${var.etcd2_proxy-refresh-interval}"
    proxy-dial-timeout          = "${var.etcd2_proxy-dial-timeout}"
    proxy-write-timeout         = "${var.etcd2_proxy-write-timeout}"
    proxy-read-timeout          = "${var.etcd2_proxy-read-timeout}"
    cert-file                   = "${var.etcd2_cert-file}"
    key-file                    = "${var.etcd2_key-file}"
    client-cert-auth            = "${var.etcd2_client-cert-auth}"
    trusted-ca-file             = "${var.etcd2_trusted-ca-file}"
    peer-cert-file              = "${var.etcd2_peer-cert-file}"
    peer-key-file               = "${var.etcd2_peer-key-file}"
    peer-client-cert-auth       = "${var.etcd2_peer-client-cert-auth}"
    peer-trusted-ca-file        = "${var.etcd2_trusted-ca-file}"
    debug                       = "${var.etcd2_debug}"
    log-package-levels          = "${var.etcd2_log-package-levels}"
  }
}
