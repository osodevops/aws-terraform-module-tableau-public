# S3 backend configuration
bucket = "<YOUR_TERRAFORM_STATE_BUCKET>"
dynamodb_table = "<YOUR_DYNAMODB_TABLE_FOR_LOCKING>"
encrypt = true
key = "tableau-data-storage/terraform.tfstate"
region = "<YOUR REGION>"

# Terraform cloud backend configuration
workspaces   { name = "staging-data-storage" }
hostname     = "app.terraform.io"
organization = "OSO"