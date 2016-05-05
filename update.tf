variable "enable_update" {
  default = true
}

variable "update_reboot-strategy" {
  default = ""
}

variable "update_group" {
  default = "stable"
}

variable "update_server" {
  default = ""
}

resource "template_file" "update_unit" {
  template = "${file("${path.module}/templates/enabled-unit.yml")}"

  vars {
    service = "update-engine"
    enabled = "${var.enable_update}"
    drop-ins = ""
  }
}

resource "template_file" "update" {
  template = "${file("${path.module}/templates/update.yml")}"

  vars {
    reboot-strategy = "${var.update_reboot-strategy}"
    group           = "${var.update_group}"
    server          = "${var.update_server}"
  }
}
