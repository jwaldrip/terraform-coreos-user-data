resource "template_file" "preformatted-user-data" {
  template = "${file("${path.module}/templates/preformatted-user-data.yml")}"

  vars {
    coreos              = "${template_file.coreos.rendered}"
    ssh_authorized_keys = "${template_file.ssh_authorized_keys.rendered}"
    hostname            = "${template_file.hostname.rendered}"
    users               = "${template_file.users.rendered}"
    write_files         = "${template_file.write_files.rendered}"
    manage_etc_hosts    = "${template_file.manage_etc_hosts.rendered}"
  }
}
