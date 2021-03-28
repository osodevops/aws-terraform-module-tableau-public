terraform {
  required_version = "= 0.12.9"
  # Partial configuration for the backend: https://www.terraform.io/docs/backends/config.html
  backend "s3" {}
}
