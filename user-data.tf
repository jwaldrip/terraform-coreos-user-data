data "template_file" "user-data" {
  template = "${file("${path.module}/templates/user-data.yml")}"

  vars {
    preformatted-user-data = "${data.template_file.preformatted-user-data.rendered}"
  }
}
