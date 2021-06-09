# Using tableau-standalone
This module creates a single or blue-green Tableau cluster, depending on how you structure the project. This example shows a blue/green deployment

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

### aws_region
Specify the AWS region you are deploying to

e.g. `aws_region = "eu-west-2"`

### instance_allowed_ips
Specify a list of CIDR blocks allowed to access Tableau instances directly.
This is generally used for access to the 8850 administrative ports, ssh, or for other diagnostics access.

e.g. `instance_allowed_ips = ['192.168.1.0/24']`

### ssh_key_name
Specify the name of a pre-existing ssh key for Tableau instance access. This may also be blank or unspecified whereby no key will be deployed. This will disable ssh access.

e.g. `ssh_key_name = "my-key"`

### vpc_name
Specify the VPC name you will deploy into. This corresponds with the `name` tag of the VPC.

e.g. `vpc_name = "tableau-vpc"`

### environment
Specify the name of your Tableau environment

e.g. `environment = "staging"`


### dns_zone
Specify a dns zone that can be managed by the cluster. DNS entries for ALBs will be created under this domain

e.g. `dns_zone = "test.mydomain.io"`

### is_private_zone
Specify if the `dns_zone` is private

e.g. `is_private_zone = false`

### alb_allowed_ips
Specify a list of CIDR blocks that are allowed to access the Tableau primary ALB.

e.g. `alb_allowed_ips = ["0.0.0.0/0"]`
alb_certificate_arn = "<YOUR ACM CERTIFICATE ARN>"

### alb_internal
Specify whether to deploy an external or internal ALB

e.g. `alb_internal = true`

### asg_desired_capacity
Specify the number of instances in the cluster to create. Must be less or equal to `asg_max_size`

e.g. `asg_desired_capacity = 3`
`
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

### data_volume_size
Specify the size in gb of the data volume provisioned to the Tableau instances.

e.g. `data_volume_size = "100"`

### instance_type
Specify the instance type to use. Tableau recommendations are currently m5.4xlarge as a minimum.

e.g. `instance_type = "m5.4xlarge"`

### root_disk_size
Specify the size of the instance root disk. This should be a minimum of 150G

e.g. `root_disk_size = "150"`

# Setting Terraform version
If you require a specific terraform version, edit the following files and fields in each deployment directory
- `terraform.tf`: edit the field `required_version`
- `.terraform-verion`: Replace the version number

The module currently supports a minimum of Terraform version `0.12.28`

# Executing terraform
This is an example of executing the terraform code for the blue deployment.

For green, repeat the process in the green directory.

```shell
> cd tableau-standalone/blue
> terraform init -backend-config=backend.hcl ../
> terraform apply ../
```
