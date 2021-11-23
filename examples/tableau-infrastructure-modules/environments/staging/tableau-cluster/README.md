# Using tableau-cluster
This module will create a tableau-cluster in your VPC.

When creating a new cluster, this module should be run after "data-storage" and "codebuild", but before "dns-selector".

The following files must be modified in order to use the Tableau module
- .terraform-version
- terraform.tf
- terraform.auto.tfvars
- cluster_definition.json

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

###  account_alias
Specify a friendly name for your account. This value is generally used to name S3 buckets

e.g. `account_alias = "tableau-stage"`

### aws_region
Specify the AWS region you are deploying to

e.g. `aws_region = "eu-west-2"`

### deployment
Specify the name of the deployment. i.e. blue or green

e.g. `deployment = "blue"`

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`

### instance_allowed_ips
Specify a list of CIDR blocks allowed to access Tableau instances directly.
This is generally used for access to the 8850 administrative ports, ssh, or for other diagnostics access.

e.g. `instance_allowed_ips = ['192.168.1.0/24']`

### ssh_key_name
Specify the name of a pre-existing ssh key for Tableau instance access. This may also be blank or unspecified whereby no key will be deployed. This will disable ssh access.

e.g. `ssh_key_name = "my-key"`

### vpc_name
Specify the exact VPC name you will deploy into. This corresponds with the `name` tag of the VPC.

e.g. `vpc_name = "tableau-vpc"`

### dns_zone
Specify a dns zone that can be managed by the cluster. DNS entries for ALBs will be created under this domain

e.g. `dns_zone = "test.mydomain.io"`

### dns_name
Specify the deployment-specific name that will be created in the above zone.

e.g. `dns_name = "blue"`

### is_private_zone
Specify if the `dns_zone` is private

e.g. `is_private_zone = false`

### alb_allowed_ips
Specify a list of CIDR blocks that are allowed to access the Tableau primary ALB.

e.g. `alb_allowed_ips = ["1.2.3.0/24"]`

### alb_certificate_arn
Specify the full arn of the pre-existing ACM certificate to attach to the deployment load balancers.

e.g. `alb_certificate_arn = "arn:aws:acm:ap-southeast-2:123456789:certificate/123456-123-123456-123456"`

### alb_internal
Specify whether to deploy an external or internally facing ALB.

e.g. `alb_internal = true`

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

### alb_tags
Specify a map of additional tags to add to the load-balancer.

e.g. `alb_tags = {"my_security_tag": "true"}`

### frontend_domain
Specify the domain users will use to access the Tableau cluster. This may be a CNAME or other entry that eventually resolves to the load-balancer.

e.g. `frontend_domain = "analytics-nonprod.mydomain"`



### enable_lambdas
Specify whether to automatically execute the configuration or termination lambdas. By default the termination lambda executes when an instance termination event occurs. The configuration lambda executes every 5 minutes.

Setting this value to "false" will disable that mechanic.

e.g. `enable_lambdas = true`

### create_lambdas
Specify whether to create the cluster lambdas. May be required when the automation lambdas are not required at all after initial cluster creation.

e.g. `create_lambdas = true`

### manage_new_nodes
Specify whether the configuration lambda should configure new nodes. This is a feature-flag.

e.g. `manage_new_nodes = true`

### manage_terminations
Specify whether the configuration lambda should manage node terminations. This is a feature-flag.

e.g. `manage_terminations = true`

### manage_zookeeper
Specify whether the configuration lambda should manage zookeeper sizing and health. This is a feature-flag.

e.g. `manage_zookeeper = true`

### manage_replicas
Specify whether the configuration lambda should manage pgsql replicas. This is a feature-flag.

e.g. `manage_replicas = true`

### maximum_zookeeper_size
Specify a limit on the maximum size of the zookeeper ensemble.

e.g. `maximum_zookeeper_size = 3`

## Configuring cluster_definition.json
This file defines your cluster layout

Reference `README-cluster-deployment.md` for details of how to configure the cluster definition file.