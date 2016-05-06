variable "hostname" {
  default = ""
}

resource "template_file" "hostname" {
  template = "${file("${path.module}/templates/hostname.yml")}"

  vars {
    hostname = "${var.hostname}"
  }
}
