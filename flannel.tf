variable "enable_flannel" {
  default = true
}
output "enable_flannel" {
value = "${var.enable_flannel}"
}

variable "flannel_public-ip" {
  default = ""
}
output "flannel_public-ip" {
value = "${var.flannel_public-ip}"
}

variable "flannel_etcd-endpoints" {
  default = ""
}
output "flannel_etcd-endpoints" {
value = "${var.flannel_etcd-endpoints}"
}

variable "flannel_etcd-prefix" {
  default = ""
}
output "flannel_etcd-prefix" {
value = "${var.flannel_etcd-prefix}"
}

variable "flannel_etcd-keyfile" {
  default = ""
}
output "flannel_etcd-keyfile" {
value = "${var.flannel_etcd-keyfile}"
}

variable "flannel_etcd-certfile" {
  default = ""
}
output "flannel_etcd-certfile" {
value = "${var.flannel_etcd-certfile}"
}

variable "flannel_interface" {
  default = ""
}
output "flannel_interface" {
value = "${var.flannel_interface}"
}

variable "flannel_subnet-file" {
  default = ""
}
output "flannel_subnet-file" {
value = "${var.flannel_subnet-file}"
}

variable "flannel_ip-masq" {
  default = ""
}
output "flannel_ip-masq" {
value = "${var.flannel_ip-masq}"
}

variable "flannel_config" {
  default = "{ \"Network\": \"10.1.0.0/16\" }"
}
output "flannel_config" {
value = "${var.flannel_config}"
}

data "template_file" "flannel_config" {
  template = "${file("${path.module}/templates/flannel-config.yml")}"

  vars {
    config = "${var.flannel_config}"
  }
}

data "template_file" "flannel_unit" {
  template = "${file("${path.module}/templates/enabled-unit.yml")}"

  vars {
    service  = "flanneld"
    enabled  = "${var.enable_flannel}"
    drop-ins = "${data.template_file.flannel_config.rendered}"
  }
}

data "template_file" "flannel" {
  template = "${file("${path.module}/templates/flannel.yml")}"

  vars {
    public-ip      = "${var.flannel_public-ip}"
    etcd-endpoints = "${var.flannel_etcd-endpoints}"
    etcd-prefix    = "${var.flannel_etcd-prefix}"
    etcd-keyfile   = "${coalesce(var.flannel_etcd-keyfile, var.etcd2_key-file)}"
    etcd-certfile  = "${coalesce(var.flannel_etcd-certfile, var.etcd2_cert-file)}"
    interface      = "${var.flannel_interface}"
    subnet-file    = "${var.flannel_subnet-file}"
    ip-masq        = "${var.flannel_ip-masq}"
  }
}
