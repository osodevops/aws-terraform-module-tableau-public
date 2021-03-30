# admin_password = "<WEB ADMIN USER PASSWORD>"
# server_password = "<LINUX SERVER USER PASSWORD>"
# licences_key_1 = "<YOUR TABLEAU LICENCE KEY>"
# aws_region = "<YOUR REGION HERE>"
# alb_allowed_ips = [<YOUR EXTERNALLY ALLOWED CIDR BLOCKS HERE>]
# instance_allowed_ips = [<YOUR INTERNALLY ALLOWED CIDR BLOCKS HERE>]
# environment = "<YOUR ENVIRONMENT NAME HERE>"
# alb_certificate_arn = "<YOUR ACM CERTIFICATE ARN>"
# ssh_key_name = "<YOUR SSH KEY-PAIR NAME>"
# vpc_name = "<YOUR VPC NAME>"

suffix = "blue"
data_volume_size = "100"
root_disk_size = "150"
instance_type = "m5.4xlarge"
common_tags = {
  Application = "Tableau Server"
  CostCode = "Tableau"
  Deployment = "Blue"
  Tool = "Terraform"
  Alarms = "true"
}
