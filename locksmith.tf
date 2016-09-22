variable "locksmith_reboot-strategy" {
  default = "best-effort"
}
output "locksmith_reboot-strategy" {
value = "${var.locksmith_reboot-strategy}"
}

variable "locksmith_endpoint" {
  default = ""
}
output "locksmith_endpoint" {
value = "${var.locksmith_endpoint}"
}

variable "locksmith_etcd-keyfile" {
  default = ""
}
output "locksmith_etcd-keyfile" {
value = "${var.locksmith_etcd-keyfile}"
}

variable "locksmith_etcd-certfile" {
  default = ""
}
output "locksmith_etcd-certfile" {
value = "${var.locksmith_etcd-certfile}"
}

variable "locksmith_group" {
  default = ""
}
output "locksmith_group" {
value = "${var.locksmith_group}"
}

data "template_file" "locksmith" {
  template = "${file("${path.module}/templates/locksmith.yml")}"

  vars {
    reboot-strategy = "${var.locksmith_reboot-strategy}"
    endpoint        = "${var.locksmith_endpoint}"
    etcd-keyfile    = "${coalesce(var.locksmith_etcd-keyfile, var.etcd2_key-file)}"
    etcd-certfile   = "${coalesce(var.locksmith_etcd-certfile, var.etcd2_cert-file)}"
    group           = "${var.locksmith_group}"
  }
}
