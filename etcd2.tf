# etcd2 Configuration
# Enable/Disable etcd2, when false, the remaining config options have no affect.
variable "enable_etcd2" {
  default = true
}

variable "etcd2_name" {
  default = ""
}

variable "etcd2_data-dir" {
  default = ""
}

variable "etcd2_snapshot-count" {
  default = ""
}

variable "etcd2_heartbeat-interval" {
  default = ""
}

variable "etcd2_election-timeout" {
  default = ""
}

variable "etcd2_listen-peer-urls" {
  default = ""
}

variable "etcd2_listen-client-urls" {
  default = ""
}

variable "etcd2_max-snapshots" {
  default = ""
}

variable "etcd2_max-wals" {
  default = ""
}

variable "etcd2_cors" {
  default = ""
}

variable "etcd2_initial-advertise-peer-urls" {
  default = ""
}

variable "etcd2_initial-cluster" {
  default = ""
}

variable "etcd2_initial-cluster-state" {
  default = ""
}

variable "etcd2_initial-cluster-token" {
  default = ""
}

variable "etcd2_advertise-client-urls" {
  default = ""
}

variable "etcd2_discovery" {
  default = ""
}

variable "etcd2_discovery-srv" {
  default = ""
}

variable "etcd2_discovery-fallback" {
  default = ""
}

variable "etcd2_discovery-proxy" {
  default = ""
}

variable "etcd2_proxy" {
  default = ""
}

variable "etcd2_proxy-failure-wait" {
  default = ""
}

variable "etcd2_proxy-refresh-interval" {
  default = ""
}

variable "etcd2_proxy-dial-timeout" {
  default = ""
}

variable "etcd2_proxy-write-timeout" {
  default = ""
}

variable "etcd2_proxy-read-timeout" {
  default = ""
}

variable "etcd2_cert-file" {
  default = ""
}

variable "etcd2_key-file" {
  default = ""
}

variable "etcd2_client-cert-auth" {
  default = ""
}

variable "etcd2_trusted-ca-file" {
  default = ""
}

variable "etcd2_peer-cert-file" {
  default = ""
}

variable "etcd2_peer-key-file" {
  default = ""
}

variable "etcd2_peer-client-cert-auth" {
  default = ""
}

variable "etcd2_peer-trusted-ca-file" {
  default = ""
}

variable "etcd2_debug" {
  default = ""
}

variable "etcd2_log-package-levels" {
  default = ""
}

// Unit file for etcd2
resource "template_file" "etcd2_unit" {
  template = "${file("${path.module}/templates/enabled-unit.yml")}"

  vars {
    service = "etcd2"
    enabled = "${var.enable_etcd2}"
    drop-ins = ""
  }
}

resource "template_file" "etcd2" {
  template = "${file("${path.module}/templates/etcd2.yml")}"

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
