variable "enable_fleet" {
  default = true
}
output "enable_fleet" {
value = "${var.enable_fleet}"
}

variable "fleet_verbosity" {
  default = ""
}
output "fleet_verbosity" {
value = "${var.fleet_verbosity}"
}

variable "fleet_etcd_servers" {
  default = ""
}
output "fleet_etcd_servers" {
value = "${var.fleet_etcd_servers}"
}

variable "fleet_etcd_request_timeout" {
  default = ""
}
output "fleet_etcd_request_timeout" {
value = "${var.fleet_etcd_request_timeout}"
}

variable "fleet_etcd_cafile" {
  default = ""
}
output "fleet_etcd_cafile" {
value = "${var.fleet_etcd_cafile}"
}

variable "fleet_etcd_keyfile" {
  default = ""
}
output "fleet_etcd_keyfile" {
value = "${var.fleet_etcd_keyfile}"
}

variable "fleet_etcd_certfile" {
  default = ""
}
output "fleet_etcd_certfile" {
value = "${var.fleet_etcd_certfile}"
}

variable "fleet_etcd_key_prefix" {
  default = ""
}
output "fleet_etcd_key_prefix" {
value = "${var.fleet_etcd_key_prefix}"
}

variable "fleet_public_ip" {
  default = "var!public_ipv4"
}
output "fleet_public_ip" {
value = "${var.fleet_public_ip}"
}

variable "fleet_metadata" {
  default = ""
}
output "fleet_metadata" {
value = "${var.fleet_metadata}"
}

variable "fleet_agent_ttl" {
  default = ""
}
output "fleet_agent_ttl" {
value = "${var.fleet_agent_ttl}"
}

variable "fleet_engine_reconcile_interval" {
  default = ""
}
output "fleet_engine_reconcile_interval" {
value = "${var.fleet_engine_reconcile_interval}"
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
