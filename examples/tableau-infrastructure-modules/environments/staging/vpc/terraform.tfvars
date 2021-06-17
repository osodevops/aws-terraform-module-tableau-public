# Account and VPC
account_name = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
cidr         = "<YOUR_VPC_CIDR_BLOCK>"
common_tags = {
  Application = "Tableau Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
  Function    = "Tableau VPC"
}
environment       = "<YOUR_ENVIRONMENT_NAME>"
internal_dns_zone = "<YOUR_INTERNAL_DNS_ZONE>"
region            = "<YOUR_REGION>"
zone = [
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
