data "template_file" "preformatted-user-data" {
  template = "${file("${path.module}/templates/preformatted-user-data.yml")}"

  vars {
    coreos              = "${data.template_file.coreos.rendered}"
    ssh_authorized_keys = "${data.template_file.ssh_authorized_keys.rendered}"
    hostname            = "${data.template_file.hostname.rendered}"
    users               = "${data.template_file.users.rendered}"
    write_files         = "${data.template_file.write_files.rendered}"
    manage_etc_hosts    = "${data.template_file.manage_etc_hosts.rendered}"
  }
}
