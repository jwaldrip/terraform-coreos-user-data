variable "update_reboot-strategy" {
  default = "best-effort"
}
output "update_reboot-strategy" {
value = "${var.update_reboot-strategy}"
}

variable "update_group" {
  default = "stable"
}
output "update_group" {
value = "${var.update_group}"
}

variable "update_server" {
  default = ""
}
output "update_server" {
value = "${var.update_server}"
}

data "template_file" "update" {
  template = "${file("${path.module}/templates/update.yml")}"

  vars {
    reboot-strategy = "${var.update_reboot-strategy}"
    group           = "${var.update_group}"
    server          = "${var.update_server}"
  }
}
