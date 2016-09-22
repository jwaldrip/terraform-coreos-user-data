variable "write_files" {
  default = ""
}
output "write_files" {
value = "${var.write_files}"
}

data "template_file" "write_files" {
  template = "${file("${path.module}/templates/write_files.yml")}"

  vars {
    write_files = "${var.write_files}"
  }
}
