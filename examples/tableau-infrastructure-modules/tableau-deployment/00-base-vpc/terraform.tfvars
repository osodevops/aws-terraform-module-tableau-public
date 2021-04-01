# account_name = "<YOUR ACCOUNT NAME HERE>"
# cidr = "<YOUR VPC CIDR BLOCK HERE. e.g. 10.19.0.0/16>"
# environment = "<YOUR ENVIRONMENT NAME HERE. e.g. stage>"
# region = "<YOUR REGION HERE>"

# Set the zones you would like to use here.
# zone = [
#   "eu-west-1a",
#   "eu-west-1b",
#   "eu-west-1c"
# ]

common_tags = {
  Application = "Tableau Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
  "Function"  = "Tableau VPC"
}

vpc_endpoint_cloudwatch_enabled     = 0
vpc_endpoint_cloudwatch_log_enabled = 0
vpc_endpoint_ec2_enabled            = 0
vpc_endpoint_s3_enabled             = 0
vpc_endpoint_ssm_enabled            = 0
