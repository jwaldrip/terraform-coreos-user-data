resource "template_file" "coreos" {
  template = "${file("${path.module}/templates/coreos.yml")}"

  vars {
    etcd2     = "${replace(replace("${var.enable_etcd2}", "true", template_file.etcd2.rendered), "/^var.enable_etcd2$/", "")}"
    fleet     = "${replace(replace("${var.enable_fleet}", "true", template_file.fleet.rendered), "/^vvar.enable_fleet$/", "")}"
    flannel     = "${replace(replace("${var.enable_flannel}", "true", template_file.flannel.rendered), "/^vvar.enable_flannel$/", "")}"
    locksmith     = "${replace(replace("${var.enable_locksmith}", "true", template_file.locksmith.rendered), "/^vvar.enable_locksmith$/", "")}"
    update     = "${replace(replace("${var.enable_update}", "true", template_file.update.rendered), "/^vvar.enable_update$/", "")}"
    etcd2     = "${replace(replace("${var.enable_etcd2}", "true", template_file.etcd2.rendered), "/^vvar.enable_etcd2$/", "")}"
    units     = "${template_file.units.rendered}"
  }
}
