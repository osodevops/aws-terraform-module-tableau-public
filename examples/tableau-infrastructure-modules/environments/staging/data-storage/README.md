# Using data-storage
This module creates data-storage S3 buckets and acts as a general data layer in the Terraform deployment

When creating new deployments, this module should be executed after codebuild and before tableau or tableau-cluster.

The following files must be modified in order to use the Tableau module
- .terraform-version
- terraform.tf
- terraform.auto.tfvars

## Configuring .terraform-version
This file is advisory and only enforces a version of the Terraform binary when used in conjunction with `tfenv`.

Populate the file with the version of Terraform you intend to use to inform consumers of the codebase of the version they should use when planning and applying.

## Configuring terraform.tf
For Terraform Cloud, configure the backend as follows:
```terraform
terraform {
  backend "remote" {
    organization = "[your organisation]"

    workspaces {
      name = "[your workspace name for this project]"
    }
  }

  ...
  
}
```

## Configuring terraform.auto.tfvars

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

###  account_alias
Specify a friendly name for your account. This value is used to name S3 buckets

e.g. `account_alias = "myaccount"`

### aws_region
Specify the AWS region you are deploying to

e.g. `aws_region = "eu-west-2"`

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`

