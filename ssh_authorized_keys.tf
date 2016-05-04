variable "ssh_authorized_keys" {
  default = ""
}

resource "template_file" "ssh_authorized_keys" {
  template = "${file("${path.module}/templates/ssh_authorized_keys.yml")}"

  vars {
    ssh_authorized_keys = "${var.ssh_authorized_keys}"
  }
}
