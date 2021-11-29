# S3 backend configuration
bucket = "<YOUR_TERRAFORM_STATE_BUCKET>"
dynamodb_table = "<YOUR_DYNAMODB_TABLE_FOR_LOCKING>"
encrypt = true
key = "tableau-cluster/blue/terraform.tfstate"
region = "<YOUR REGION>"

# Terraform cloud backend configuration
workspaces   { name = "staging-blue-tableau-cluster" }
hostname     = "app.terraform.io"
organization = "OSO"