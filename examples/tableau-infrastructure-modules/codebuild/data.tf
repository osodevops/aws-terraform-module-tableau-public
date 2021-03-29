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
