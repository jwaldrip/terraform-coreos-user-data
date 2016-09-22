resource "null_resource" "validator" {
  triggers {
    user-data          = "${data.template_file.user-data.rendered}"
    validator-contents = "${file("${path.module}/validator.tf")}"
  }

  provisioner "local-exec" {
    command = <<-EOF
      set -e
      curl -sSLfk "https://validate.core-os.net/validate" -X PUT -H "Content-Type: text/plain" -H "Accept: application/json" --data-binary @- <<'__USERDATA__' | tee /dev/stderr | if grep -E "error|warning" ; then false ; else true ; fi
${data.template_file.user-data.rendered}
__USERDATA__
    EOF
  }
}
