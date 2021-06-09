data "aws_subnet_ids" "packer_build_subnets" {
  vpc_id = data.aws_vpc.packer_build_vpc.id

  tags = {
    Class = var.packer_subnet_class_filter
  }
}

data "aws_subnet_ids" "codebuild_private_subnets" {
  vpc_id = data.aws_vpc.packer_build_vpc.id

  tags = {
    Type = "Private*"
  }
}

data "aws_vpc" "packer_build_vpc" {
  filter {
    name   = "tag:Class"
    values = [var.vpc_class_filter]
  }
}

data "aws_ssm_parameter" "github_oauth_token" {
  name = "/${var.environment}/codebuild/github_personal_access_token"
}
