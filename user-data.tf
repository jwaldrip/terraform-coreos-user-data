resource "template_file" "user-data" {
  template = "${file("${path.module}/templates/user-data.yml")}"

  provisioner "local-exec" {
    command = "curl -s 'https://validate.core-os.net/validate' -X PUT -H 'Content-Type: text/plain' -H 'Accept: application/json' --data-binary @- <<'__USERDATA__' | tee /dev/stderr | grep --invert-match -E '(error|warning)' > /dev/null\n${template_file.user-data.rendered}\n__USERDATA__"
  }

  vars {
    preformatted-user-data = "${template_file.preformatted-user-data.rendered}"
  }
}
