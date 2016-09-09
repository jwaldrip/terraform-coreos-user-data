resource "template_file" "user-data" {
  template = "${file("${path.module}/templates/user-data.yml")}"

  provisioner "local-exec" {
    command = <<-EOF
      set -e
      curl -sSLfk "https://validate.core-os.net/validate" -X PUT -H "Content-Type: text/plain" -H "Accept: application/json" --data-binary @- <<'__USERDATA__' | tee /dev/stderr | if grep -E "error|warning" ; then false ; else true ; fi
${template_file.user-data.rendered}
__USERDATA__
    EOF
  }

  vars {
    preformatted-user-data = "${template_file.preformatted-user-data.rendered}"
  }
}
