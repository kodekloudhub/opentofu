resource "local_file" "file" {
  filename = "terraform.txt"
  content  = "This file has been created with Terraform"
}
