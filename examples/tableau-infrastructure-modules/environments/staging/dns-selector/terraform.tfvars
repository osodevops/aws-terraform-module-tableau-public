# Account
aws_region = "<YOUR REGION HERE>"
common_tags = {
  Application = "Tableau-Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
}
environment = "<YOUR ENVIRONMENT NAME HERE>"

# DNS configuration
dns_zone        = "<YOUR DNS ZONE HERE>"
is_private_zone = "<IF THE DNS ZONE IS PRIVATE>"

# blue/green selection
suffix = "blue"
