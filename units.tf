variable "units" {
  default = ""
}

// Template for units
data "template_file" "units" {
  template = "${file("${path.module}/templates/units.yml")}"

  vars {
    etcd2_unit   = "${data.template_file.etcd2_unit.rendered}"
    fleet_unit   = "${data.template_file.fleet_unit.rendered}"
    flannel_unit = "${data.template_file.flannel_unit.rendered}"
    units        = "${var.units}"
  }
}
