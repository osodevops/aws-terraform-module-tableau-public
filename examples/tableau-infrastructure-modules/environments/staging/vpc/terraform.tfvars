# Account and VPC
account_name      = "<YOUR ACCOUNT NAME HERE>"
cidr              = "<YOUR VPC CIDR BLOCK HERE. e.g. 10.19.0.0/16>"
common_tags       = {
  Application = "Tableau Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
  Function    = "Tableau VPC"
}
environment       = "<YOUR ENVIRONMENT NAME HERE>"
internal_dns_zone = "<INTERNAL DNS ZONE>"
region            = "<YOUR REGION HERE>"
zone              = [
  "eu-west-1a",
  "eu-west-1b",
  "eu-west-1c"
]

# Endpoint flags
vpc_endpoint_cloudwatch_enabled     = 1
vpc_endpoint_cloudwatch_log_enabled = 1
vpc_endpoint_ec2_enabled            = 1
vpc_endpoint_s3_enabled             = 1
vpc_endpoint_ssm_enabled            = 1
vpc_endpoint_dynamodb_enabled       = 1
