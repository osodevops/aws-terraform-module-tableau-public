# Configuring your deployment
The following files must be modified in order to use the Tableau module

## Configuring `/codebuild`
The terraform will create a bucket for backing up the Tableau user-data files and workspaces.
This is required for Tableau to function.

### Name your environments
The example environment is called `staging`. Rename the `codebuild/staging` directory to one that matches your chosen environment naming-scheme.

If you are deploying more than one environment, copy the environment directory to a new name.

### Configure `backend.hcl`
For each environment, edit the `staging/backend.hcl` file and populate the following parameters:

- `bucket`: Set this to the name of the S3 bucket you are going to use for Terraform state
- `dynamodb_table`: Set this to the name of the DynamoDB table you are going to use for Terraform locking
- `region`: Set this to the region where you want your backup bucket to be deployed

### Configure `terraform.tfvars`
For each environment, edit the `staging/terraform.tfvars` file and populate the following parameters:
- `aws_region`: Set this to the region where you want your backup bucket to be deployed
- `environment`: Set this to the a name representing your environment. **The value must be lowercase**, e.g. "stage"
- `github_token`: Set this to the Personal Access Token for a Github user. **Remember never to commit this value to a repository as it will represent a security risk.**

## Setting Terraform version
If you require a specific terraform version, edit the following files and fields
- `terraform.tf`: edit the field `required_version`
- `staging/.terraform-verion`: Replace the version number

This module currently supports a minimum of Terraform version `0.12.9`

# Executing terraform
This is an example of initialising, planning, and executing the terraform code.

```shell
> cd codebuild/staging
> terraform init -backend-config=backend.hcl ../
> terraform plan ../
> terraform apply ../
```
