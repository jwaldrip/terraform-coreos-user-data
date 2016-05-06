variable "units" {
  default = ""
}

// Template for units
resource "template_file" "units" {
  template = "${file("${path.module}/templates/units.yml")}"

  vars {
    etcd2_unit   = "${template_file.etcd2_unit.rendered}"
    fleet_unit   = "${template_file.fleet_unit.rendered}"
    flannel_unit = "${template_file.flannel_unit.rendered}"
    units        = "${var.units}"
  }
}
