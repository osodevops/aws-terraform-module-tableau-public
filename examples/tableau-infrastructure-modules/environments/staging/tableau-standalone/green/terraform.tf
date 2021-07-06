terraform {
  # Partial configuration for the backend: https://www.terraform.io/docs/backends/config.html
  backend "s3" {}
  required_providers {
    aws = {
      version = ">= 3.19"
    }
  }
}
