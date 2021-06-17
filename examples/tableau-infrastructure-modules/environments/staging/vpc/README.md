# Using vpc
This module creates an AWS VPC to house a Tableau installation

The following files must be modified in each deployment directory in order to use the Tableau module
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

### cidr
Specify the CIDR block to assign to the new VPC

e.g. `cidr = "10.19.0.0/16"`

### common_tags
Specify a map of tags to apply to all resources created by the module

e.g.
```
common_tags = {
    Application = "Tableau Server"
    CostCode = "Tableau"
    Deployment = "Blue"
    Tool = "Terraform"
    Alarms = "true"
}
```

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`

### internal_dns_zone
Specify a DNS name for internal use.

e.g. `internal_dns_zone = "internal.cloud""`

### region
Specify the AWS region you are deploying to

e.g. `region = "eu-west-2"`

### zone
Specify a list of zones to utilize from your deployment region.

e.g. `zone = [
"eu-west-1a",
"eu-west-1b",
"eu-west-1c"
]`

### VPC endpoint flags
The following flags will create or destroy regional endpoints for services you want to use. A value of `1` will provision the endpoint, `0` will remove it

AWS recommend creation of regional endpoints as good practice.

e.g. `vpc_endpoint_s3_enabled = 1`

- vpc_endpoint_cloudwatch_enabled
- vpc_endpoint_cloudwatch_log_enabled
- vpc_endpoint_ec2_enabled
- vpc_endpoint_s3_enabled
- vpc_endpoint_ssm_enabled
- vpc_endpoint_dynamodb_enabled

## Setting Terraform version
If you require a specific terraform version, edit the following files and fields
- `terraform.tf`: edit the field `required_version`
- `.terraform-verion`: Replace the version number

The module currently supports a minimum of Terraform version `0.12.28`

# Executing terraform
This is an example of executing the terraform code.

```shell
> cd vpc
> terraform init -backend-config=backend.hcl
> terraform apply
```
