# S3 backend configuration
bucket = "<YOUR_TERRAFORM_STATE_BUCKET>"
dynamodb_table = "<YOUR_DYNAMODB_TABLE_FOR_LOCKING>"
encrypt = true
key = "tableau-blue/terraform.tfstate"
region = "<YOUR_REGION>"

# Terraform cloud backend configuration
workspaces { name = "staging-blue-tableau" }
hostname     = "app.terraform.io"
organization = "OSO"