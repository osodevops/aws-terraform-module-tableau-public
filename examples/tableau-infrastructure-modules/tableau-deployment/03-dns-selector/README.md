# Configuring your deployment
The following files must be modified in order to use the Tableau module

## Configuring `/03-dns-selector`
This terraform selects one of the blue or green Tableau deployments to be "live".

A DNS entry for "tableau.<domain>" will be created pointing to the appropriate load balancer.

### Name your environments
The example environment is called `staging`. Rename the `03-dns-selector/staging` directory to one that matches your chosen environment naming-scheme.

If you are deploying more than one environment, copy the environment directory to a new name.

### Configure `backend.hcl`
For each environment, edit the `staging/backend.hcl` file and populate the following parameters:

- `bucket`: Set this to the name of the S3 bucket you are going to use for Terraform state
- `dynamodb_table`: Set this to the name of the DynamoDB table you are going to use for Terraform locking
- `region`: Set this to the region where you want your backup bucket to be deployed

### Configure `terraform.tfvars`
For each environment, edit the `staging/terraform.tfvars` file and populate the following parameters:

- `aws_region`: Set this to the region you are using for this Tableau installation
- `environment`: Set this to the name of your environment. **The value must be lowercase** e.g. "staging"
- `public_dns_zone`: Set this to the name of your pre-configured route53 public dns zome

## Setting Terraform version
If you require a specific terraform version, edit the following files and fields
- `terraform.tf`: edit the field `required_version`
- `staging/.terraform-verion`: Replace the version number

The module currently supports a minimum of Terraform version `0.12.9`

# Executing terraform
This is an example of executing the terraform code.

```shell
> cd tableau-deployment/03-dns-selector/staging
> terraform init -backend-config=backend.hcl ../
> terraform plan ../
> terraform apply ../
```

# Switching the "live" Tableau installation
To swap between `green` and `blue` deployments, edit `03-dns-selector/staging/terraform.tfvars`

Replace the `suffix` value with the one you want.

Now re-execute the dns selector terraform as above.
