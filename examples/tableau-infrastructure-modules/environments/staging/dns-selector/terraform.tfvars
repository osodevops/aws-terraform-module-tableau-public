# Account
aws_region = "<YOUR_REGION>"
common_tags = {
  Application = "Tableau-Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
}
environment = "<YOUR_ENVIRONMENT_NAME>"

# DNS configuration
dns_zone        = "<YOUR_DNS_ZONE>"
is_private_zone = "<IS_DNS_ZONE_PRIVATE>"

# blue/green selection
suffix = "blue"
