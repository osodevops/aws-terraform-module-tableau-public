terraform {
  # backend "remote" {}
  backend "s3" {}

  required_providers {
    aws = {
      version = "~> 3"
    }
  }
}
