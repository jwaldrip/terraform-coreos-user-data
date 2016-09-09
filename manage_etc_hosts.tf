variable "manage_etc_hosts" {
  default = ""
}

data "template_file" "manage_etc_hosts" {
  template = "${file("${path.module}/templates/manage_etc_hosts.yml")}"

  vars {
    manage_etc_hosts = "${var.manage_etc_hosts}"
  }
}
