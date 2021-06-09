# Using backup-bucket
This module creates S3 buckets and permissions that enable backups of the Tableau installation

The following files must be modified in order to use the Tableau module
- backend.hcl
- terraform.tfvars

## Configuring backend.hcl
The following items should be configured before your terraform run

### bucket
Specify a bucket to store your terraform state

e.g. `bucket = "myaccount-tf-state-eu-west-2"`

### dynamodb_table
Specify the name of a dynamodb table to store terraform state

e.g. `dynamodb_table = "terraform-state-lock-dynamo"`

### region
Specify the AWS region you are deploying to

e.g. `region = "eu-west-2"`

### encrypt
Specify whether the S3 backend state should be encrypted. Usually true

e.g. `encrypt = true`

### key
Specify the name of the S3 key where the Terraform state will be stored

e.g. `key = "tableau-cluster/terraform.tfstate"`


## Configuring terraform.tf

###  account_alias
Specify a friendly name for your account. This value is generally used to safely name S3 buckets

e.g. `account_alias = "tableau-stage"`

### aws_region
Specify the AWS region you are deploying to

e.g. `aws_region = "eu-west-2"`

### common_tags
Specify a map of tags to apply to all resources created by the module

e.g.
```
common_tags = {
    Application = "Tableau Server"
    CostCode = "Tableau"
    Tool = "Terraform"
    Alarms = "true"
}
```

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`


# Setting Terraform version
If you require a specific terraform version, edit the following files and fields
- `terraform.tf`: edit the field `required_version`
- `.terraform-verion`: Replace the version number

The module currently supports a minimum of Terraform version `0.12.28`

# Executing terraform
This is an example of executing the terraform code.

```shell
> cd backup-bucket
> terraform init -backend-config=backend.hcl
> terraform apply
```
