module "tableau" {
  source                              = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau-vpc.git"
  account_name                        = var.account_name
  region                              = var.region
  cidr                                = var.cidr
  environment                         = var.environment
  common_tags                         = var.common_tags
  zone                                = var.zone
  vpc_endpoint_cloudwatch_enabled     = var.vpc_endpoint_cloudwatch_enabled
  vpc_endpoint_cloudwatch_log_enabled = var.vpc_endpoint_cloudwatch_log_enabled
  vpc_endpoint_ec2_enabled            = var.vpc_endpoint_ec2_enabled
  vpc_endpoint_s3_enabled             = var.vpc_endpoint_s3_enabled
  vpc_endpoint_ssm_enabled            = var.vpc_endpoint_ssm_enabled
  vpc_endpoint_dynamodb_enabled       = var.vpc_endpoint_dynamodb_enabled
  internal_dns_zone                   = var.internal_dns_zone
}
