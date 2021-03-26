# Configuring your deployment
The following files must be modified in order to use the Tableau module

## Configuring `/02-ha-tableau`
This terraform will create `blue` and `green` Tableau installations in a single environment.

### Name your environments
The example environment is called `staging`. Rename the `02-ha-tableau/staging` directory to one that matches your chosen environment naming-scheme.

If you are deploying more than one environment, copy the environment directory to a new name.

### Configure `backend.hcl`
For each environment, edit the `staging/blue/backend.hcl` and `staging/green/backend.hcl` files and populate the following parameters:

- `bucket`: Set this to the name of the S3 bucket you are going to use for Terraform state
- `dynamodb_table`: Set this to the name of the DynamoDB table you are going to use for Terraform locking
- `region`: Set this to the region where you want your backup bucket to be deployed

### Configure `terraform.tfvars`
For each environment, edit the `staging/blue/terraform.tfvars` and `staging/blue/terraform.tfvars` files and populate the following parameters:

- `admin_password`: Set this to the desired password of the Web UI admin user. **This must be an 8 character alphanumeric string**
- `server_password`: Set this to the desired password for the tableau_srv OS user. **This must be an 8 character alphanumeric string**
- `licences_key_1`:  Set this to the Tableau license key. *This item is optional, but you will receive a trial license activation without it.*
- `aws_region`: Set this to the region you are using for this Tableau installation
- `alb_allowed_ips`: Set this to a List of CIDR blocks you want to access the Tableau **external** load balancers
- `instance_allowed_ips`: Set this to a list of CIDR blocks you want to access the **internal** Tableau ports
- `environment`: Set this to the name of your environment. **The value must be lowercase** e.g. "staging"
- `alb_certificate_arn`: Set this to the full arn of your pre-existing ACM certificate
- `ssh_key_name`: Set this to the name of any ssh key you want to deploy on the Tableau instances. *This item is optional*
- `vpc_name`: Set this to the name of the desired pre-existing VPC

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
> cd tableau-deployment/02-ha-tableau/staging/blue
> terraform init -backend-config=backend.hcl ../../
> terraform plan ../../
> terraform apply ../../
```
