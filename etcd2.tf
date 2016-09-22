# etcd2 Configuration
# Enable/Disable etcd2, when false, the remaining config options have no affect.
variable "enable_etcd2" {
  default = true
}
output "enable_etcd2" {
value = "${var.enable_etcd2}"
}

variable "etcd2_name" {
  default = ""
}
output "etcd2_name" {
value = "${var.etcd2_name}"
}

variable "etcd2_data-dir" {
  default = ""
}
output "etcd2_data-dir" {
value = "${var.etcd2_data-dir}"
}

variable "etcd2_snapshot-count" {
  default = ""
}
output "etcd2_snapshot-count" {
value = "${var.etcd2_snapshot-count}"
}

variable "etcd2_heartbeat-interval" {
  default = ""
}
output "etcd2_heartbeat-interval" {
value = "${var.etcd2_heartbeat-interval}"
}

variable "etcd2_election-timeout" {
  default = ""
}
output "etcd2_election-timeout" {
value = "${var.etcd2_election-timeout}"
}

variable "etcd2_listen-peer-urls" {
  default = ""
}
output "etcd2_listen-peer-urls" {
value = "${var.etcd2_listen-peer-urls}"
}

variable "etcd2_listen-client-urls" {
  default = ""
}
output "etcd2_listen-client-urls" {
value = "${var.etcd2_listen-client-urls}"
}

variable "etcd2_max-snapshots" {
  default = ""
}
output "etcd2_max-snapshots" {
value = "${var.etcd2_max-snapshots}"
}

variable "etcd2_max-wals" {
  default = ""
}
output "etcd2_max-wals" {
value = "${var.etcd2_max-wals}"
}

variable "etcd2_cors" {
  default = ""
}
output "etcd2_cors" {
value = "${var.etcd2_cors}"
}

variable "etcd2_initial-advertise-peer-urls" {
  default = ""
}
output "etcd2_initial-advertise-peer-urls" {
value = "${var.etcd2_initial-advertise-peer-urls}"
}

variable "etcd2_initial-cluster" {
  default = ""
}
output "etcd2_initial-cluster" {
value = "${var.etcd2_initial-cluster}"
}

variable "etcd2_initial-cluster-state" {
  default = ""
}
output "etcd2_initial-cluster-state" {
value = "${var.etcd2_initial-cluster-state}"
}

variable "etcd2_initial-cluster-token" {
  default = ""
}
output "etcd2_initial-cluster-token" {
value = "${var.etcd2_initial-cluster-token}"
}

variable "etcd2_advertise-client-urls" {
  default = ""
}
output "etcd2_advertise-client-urls" {
value = "${var.etcd2_advertise-client-urls}"
}

variable "etcd2_discovery" {
  default = ""
}
output "etcd2_discovery" {
value = "${var.etcd2_discovery}"
}

variable "etcd2_discovery-srv" {
  default = ""
}
output "etcd2_discovery-srv" {
value = "${var.etcd2_discovery-srv}"
}

variable "etcd2_discovery-fallback" {
  default = ""
}
output "etcd2_discovery-fallback" {
value = "${var.etcd2_discovery-fallback}"
}

variable "etcd2_discovery-proxy" {
  default = ""
}
output "etcd2_discovery-proxy" {
value = "${var.etcd2_discovery-proxy}"
}

variable "etcd2_proxy" {
  default = ""
}
output "etcd2_proxy" {
value = "${var.etcd2_proxy}"
}

variable "etcd2_proxy-failure-wait" {
  default = ""
}
output "etcd2_proxy-failure-wait" {
value = "${var.etcd2_proxy-failure-wait}"
}

variable "etcd2_proxy-refresh-interval" {
  default = ""
}
output "etcd2_proxy-refresh-interval" {
value = "${var.etcd2_proxy-refresh-interval}"
}

variable "etcd2_proxy-dial-timeout" {
  default = ""
}
output "etcd2_proxy-dial-timeout" {
value = "${var.etcd2_proxy-dial-timeout}"
}

variable "etcd2_proxy-write-timeout" {
  default = ""
}
output "etcd2_proxy-write-timeout" {
value = "${var.etcd2_proxy-write-timeout}"
}

variable "etcd2_proxy-read-timeout" {
  default = ""
}
output "etcd2_proxy-read-timeout" {
value = "${var.etcd2_proxy-read-timeout}"
}

variable "etcd2_cert-file" {
  default = ""
}
output "etcd2_cert-file" {
value = "${var.etcd2_cert-file}"
}

variable "etcd2_key-file" {
  default = ""
}
output "etcd2_key-file" {
value = "${var.etcd2_key-file}"
}

variable "etcd2_client-cert-auth" {
  default = ""
}
output "etcd2_client-cert-auth" {
value = "${var.etcd2_client-cert-auth}"
}

variable "etcd2_trusted-ca-file" {
  default = ""
}
output "etcd2_trusted-ca-file" {
value = "${var.etcd2_trusted-ca-file}"
}

variable "etcd2_peer-cert-file" {
  default = ""
}
output "etcd2_peer-cert-file" {
value = "${var.etcd2_peer-cert-file}"
}

variable "etcd2_peer-key-file" {
  default = ""
}
output "etcd2_peer-key-file" {
value = "${var.etcd2_peer-key-file}"
}

variable "etcd2_peer-client-cert-auth" {
  default = ""
}
output "etcd2_peer-client-cert-auth" {
value = "${var.etcd2_peer-client-cert-auth}"
}

variable "etcd2_peer-trusted-ca-file" {
  default = ""
}
output "etcd2_peer-trusted-ca-file" {
value = "${var.etcd2_peer-trusted-ca-file}"
}

variable "etcd2_debug" {
  default = ""
}
output "etcd2_debug" {
value = "${var.etcd2_debug}"
}

variable "etcd2_log-package-levels" {
  default = ""
}
output "etcd2_log-package-levels" {
value = "${var.etcd2_log-package-levels}"
}

// Unit file for etcd2
data "template_file" "etcd2_unit" {
  template = "${file("${path.module}/templates/enabled-unit.yml")}"

  vars {
    service  = "etcd2"
    enabled  = "${var.enable_etcd2}"
    drop-ins = ""
  }
}

data "template_file" "etcd2" {
  template = "${file("${path.module}/templates/etcd2.yml")}"

  vars {
    name                        = "${var.etcd2_name}"
    data-dir                    = "${var.etcd2_data-dir}"
    snapshot-count              = "${var.etcd2_snapshot-count}"
    heartbeat-interval          = "${var.etcd2_heartbeat-interval}"
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
