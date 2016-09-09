output "user-data" {
  value = "${data.template_file.user-data.rendered}"
}
