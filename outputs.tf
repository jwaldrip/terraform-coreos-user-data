output "userdata" {
  value = "${template_file.user-data.rendered}"
}
