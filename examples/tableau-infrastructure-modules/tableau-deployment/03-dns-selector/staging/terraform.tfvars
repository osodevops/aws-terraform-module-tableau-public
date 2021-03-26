# aws_region = "<YOUR REGION HERE>"
# environment = "<YOUR ENVIRONMENT NAME HERE>"
# public_dns_zone = "<YOUR PUBLIC DNS ZONE HERE>"

assume_role = "Terraforming-Local-Admin"
common_tags = {
  Application = "Tableau-Server"
  CostCode = "Tableau"
  Tool = "Terraform"
}

# Select "blue" or "green" to flip the DNS to the appropriate Tableau installation
suffix = "blue"
