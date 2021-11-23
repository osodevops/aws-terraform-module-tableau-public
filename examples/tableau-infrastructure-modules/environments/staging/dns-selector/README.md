# Using dns-selector
This module creates the "live" DNS entry for a blue/green Tableau deployment and aliases it to the current "live" load-balancer.

The parameter "suffix" determines which deployment is aliased to the DNS entry.

When creating new deployments, this module should be executed last.

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


### dns_zone_private
Specify the pre-existing private zone where the `tableau` hostname will be configured.

e.g. `dns_zone_private = "test.osodevops.io"`

### dns_zone_public
Specify the pre-existing public zone where the `tableau` hostname will be configured.

e.g. `dns_zone_public = "test.osodevops.io"`

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`

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

### suffix
Specify name of the deployment the `tableau` hostname should attached to.

e.g. `suffix = "blue"`
