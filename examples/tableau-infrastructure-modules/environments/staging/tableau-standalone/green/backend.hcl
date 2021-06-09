# bucket = "<YOUR BUCKET FOR ENVIRONMENT>"
# dynamodb_table = "<YOUR DYNAMODB TABLE FOR LOCKING>"
# region = "<YOUR REGION>"

key = "tableau-green/terraform.tfstate"
encrypt = true

# customized
bucket = "oso-ops-109716644331-tf-state-eu-west-2"
dynamodb_table = "terraform-state-lock-dynamo"
region = "eu-west-2"