module "codebuilder" {
  source                       = "git::ssh://git@github.com/osodevops/aws-terraform-module-codebuild-packer.git"
  codebuild_private_subnet_ids = data.aws_subnet_ids.codebuild_private_subnets.ids
  common_tags                  = var.common_tags
  environment                  = var.environment
  encrypt_ami                  = var.encrypt_ami
  github_token                 = data.aws_ssm_parameter.github_oauth_token.value
  packer_file_location         = var.packer_file_location
  packer_vars_file_location    = var.packer_vars_file_location
  packer_build_subnet_ids      = data.aws_subnet_ids.packer_build_subnets.ids
  project_name                 = var.project_name
  source_repository_url        = var.source_repository_url
  vpc_id                       = data.aws_vpc.packer_build_vpc.id
  s3_resource_name             = local.s3_codebuild_storage_name
}
