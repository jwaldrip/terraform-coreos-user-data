resource "template_file" "coreos" {
  template = "${file("${path.module}/templates/coreos.yml")}"

  vars {
    etcd2     = "${replace(replace("${var.enable_etcd2}", "/^(true|1)$/", template_file.etcd2.rendered), "/^${var.enable_etcd2}$/", "")}"
    fleet     = "${replace(replace("${var.enable_fleet}", "/^(true|1)$/", template_file.fleet.rendered), "/^${var.enable_fleet}$/", "")}"
    flannel   = "${replace(replace("${var.enable_flannel}", "/^(true|1)$/", template_file.flannel.rendered), "/^${var.enable_flannel}$/", "")}"
    locksmith = "${template_file.locksmith.rendered}"
    update    = "${template_file.update.rendered}"
    units     = "${template_file.units.rendered}"
  }
}
