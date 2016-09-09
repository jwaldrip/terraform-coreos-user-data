variable "enable_fleet" {
  default = true
}

variable "fleet_verbosity" {
  default = ""
}

variable "fleet_etcd_servers" {
  default = ""
}

variable "fleet_etcd_request_timeout" {
  default = ""
}

variable "fleet_etcd_cafile" {
  default = ""
}

variable "fleet_etcd_keyfile" {
  default = ""
}

variable "fleet_etcd_certfile" {
  default = ""
}

variable "fleet_etcd_key_prefix" {
  default = ""
}

variable "fleet_public_ip" {
  default = "var!public_ipv4"
}

variable "fleet_metadata" {
  default = ""
}

variable "fleet_agent_ttl" {
  default = ""
}

variable "fleet_engine_reconcile_interval" {
  default = ""
}

data "template_file" "fleet_unit" {
  template = "${file("${path.module}/templates/enabled-unit.yml")}"

  vars {
    service  = "fleet"
    enabled  = "${var.enable_fleet}"
    drop-ins = ""
  }
}

data "template_file" "fleet" {
  template = "${file("${path.module}/templates/fleet.yml")}"

  vars {
    verbosity                 = "${var.fleet_verbosity}"
    etcd_servers              = "${var.fleet_etcd_servers}"
    etcd_request_timeout      = "${var.fleet_etcd_request_timeout}"
    etcd_keyfile              = "${coalesce(var.fleet_etcd_keyfile, var.etcd2_key-file)}"
    etcd_certfile             = "${coalesce(var.fleet_etcd_certfile, var.etcd2_cert-file)}"
    etcd_key_prefix           = "${var.fleet_etcd_key_prefix}"
    public_ip                 = "${var.fleet_public_ip}"
    metadata                  = "${var.fleet_metadata}"
    agent_ttl                 = "${var.fleet_agent_ttl}"
    engine_reconcile_interval = "${var.fleet_engine_reconcile_interval}"
  }
}
