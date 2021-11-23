# Using codebuild
The module will create a CodeBuild project that builds the Tableau AMI, associated resources, and an artefact storage S3 buckets.

When creating new deployments, this module should be executed before any other modules in the OSO Tableau deployment.

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

### aws_region
Specify the AWS region you are deploying to

e.g. `aws_region = "eu-west-2"`

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`

### packer_file_location
Specify which packfile to use during the AMI build. Unless you have created alternative packfiles, this should be "ami/packfiles/amazon.json"

e.g. `packer_file_location = "ami/packfiles/amazon.json"`

###  account_alias
Specify a friendly name for your account. This value is generally used to safely name S3 buckets

e.g. `account_alias = "tableau-stage"`

### project_name
Specify the name of the CodeBuild project.

e.g. `project_name = "tableau"`

### encrypt_ami
Specify whether you want the resulting AMIs to be encrypted with the default AWS encryption key

e.g. `encrypt_ami = true`

### packer_vars_file_location
Specify the vars file to use during the AMI build. Unless you have created an alternative default.json, this file can be left with its default value.

e.g. `packer_vars_file_location = "ami/environment/default.json"`

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

### private_subnet_filter
Specify the pattern that should be used to match the build subnets for CodeBuild. This value should match a private range of subnets.

e.g. `private_subnet_filter = "SubnetPrivate*"`

**Client specific: For FMG, this string is compared to the tag `aws:cloudformation:logical-id`**

### source_repository_url
Specify the location of the source repository

e.g. `source_repository_url = "https://github.com/osodevops/aws-terraform-module-tableau"`

###vpc_name
Specify the exact name of the VPC to host CodeBuild

e.g. `vpc_name = "tableau-nonprod-vpc"`
