# Installing a VPC
The following files must be modified in order to use the Tableau module

## Configuring `/00-base-vpc
This terraform will create a VPC including all the necessary components to host the tableau module

### Configure `backend.hcl`
For each VPC, edit the `backend.hcl` file and populate the following parameters:

- `bucket`: Set this to the name of the S3 bucket you are going to use for Terraform state
- `dynamodb_table`: Set this to the name of the DynamoDB table you are going to use for Terraform locking
- `region`: Set this to the region where your VPC will be deployed

### Configure `terraform.tfvars`
For each VPC, edit the `terraform.tfvars` file and populate the following parameters:

- `account_name`: This is the friendly name for the account you are using for the VPC. This value is used for naming and tagging only.
- `cidr`: Set this to desired CIDR block of your VPC.
- `region`: Set this to the region you are using for this Tableau installation
- `environment`: Set this to the name of your environment. **The value must be lowercase** e.g. "staging"
- `zone`: Set this to a list of the zones you will deploy inside your VPC. Public and private subnets will be created in all zones listed.

## Setting Terraform version
If you require a specific terraform version, edit the following files and fields
- `terraform.tf`: edit the field `required_version`
- `staging/blue/.terraform-verion`: Replace the version number
- `staging/green/.terraform-verion`: Replace the version number

The module currently supports a minimum of Terraform version `0.12.9`

# Executing terraform
This is an example of executing the terraform code for the blue deployment.

For green, repeat the process in the green directory.

```shell
> cd tableau-deployment/00-base-vpc
> terraform init -backend-config=backend.hcl
> terraform plan
> terraform apply
```
