variable "locksmith_reboot-strategy" {
  default = "best-effort"
}

variable "locksmith_endpoint" {
  default = ""
}

variable "locksmith_etcd-keyfile" {
  default = ""
}

variable "locksmith_etcd-certfile" {
  default = ""
}

variable "locksmith_group" {
  default = ""
}

resource "template_file" "locksmith" {
  template = "${file("${path.module}/templates/locksmith.yml")}"

  vars {
    reboot-strategy      = "${var.locksmith_reboot-strategy}"
    endpoint             = "${var.locksmith_endpoint}"
    etcd-keyfile         = "${coalesce(var.locksmith_etcd-keyfile, var.etcd2_key-file)}"
    etcd-certfile        = "${coalesce(var.locksmith_etcd-certfile, var.etcd2_cert-file)}"
    group                = "${var.locksmith_group}"
  }
}
