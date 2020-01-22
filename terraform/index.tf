terraform {
  backend azurerm {}
}

resource "local_file" "foo" {
  content  = "FILE_CONTENTS"
  filename = "${path.module}/tmp-file.txt"
}
