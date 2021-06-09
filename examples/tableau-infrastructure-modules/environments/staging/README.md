# Using the tableau-deployment skeleton terraform directory
This repo is to get you started using the OSO standalone reusable Tableau deployment module

We publish this structure publicly so you can see how you might integrate it into your infrastructure, but to see the modules to which it refers, you must purchase the module

If you're already purchased this module, please refer to the full deployment guide at: <https://github.com/osodevops/aws-terraform-module-tableau/deployment_guide.md>.

If you're interested in using our re-usable Tableau deployment, contact us at <enquiries@osodevops.io> or <https://osodevops.io/> for more information.

To configure the structure for use, follow the README.md files in the directories in order, and refer to the deployment guide document.

# Deployment options
The module currently supports standalone, blue/green, and clustered deployments.

### Standalone
Implements a single Tableau server within a VPC.

Uses the following modules:
- vpc (optional)
- codebuild
- backup-bucket
- tableau-standalone

### Blue / Green
Implements two standalone deployments that can be managed independently, or used as part of a failover implementation.

Uses the following modules:
- vpc (optional)
- codebuild
- backup-bucket
- tableau-standalone
- dns-selector

### Cluster
Implements a Tableau cluster of between 1 and 5 nodes.

Uses the following modules:
- vpc (optional)
- codebuild
- backup-bucket
- tableau-cluster

# Deployming Tableau
### Step 1
Once you know which style of deployment you want, configure each of the required modules.

Individual README files are available in each module to explain the options.

### Step 2
Create AWS pre-requisites

These should include
- Unprivileged engineering IAM roles
- A privileged Terraform IAM role
- Bootstrap S3 and DynamoDB configuration for Terraform (which OSO can provide on request)
- A VPC (This is optional, as you can include the OSO VPC module, which will configure tags and subnets as required by the solution)

### Step 3
Import the OSO solution modules into your codebase

The solution consists of high-level modules as represented in this example code, and low-level modules which do the actual work.

Where these items sit in your codebase and how the environments are structured is up to you.

### Step 4
Start applying Terraform

Initially, the `vpc`, `backup-bucket` and `codebuild` modules should be executed against your AWS account.

### Step 5
Create the Tableau AMI by executing the CodeBuild project created in the previous step

### Step 6
Execute Terraform against the tableau modules of your choice

**If you are deploying a cluster**, set `enable_lambdas` and `create_lambdas` to false on the first run. You will need to create and upload lambda artefacts before the run can complete successfully for the first time. Details of how to do this are in the OSO solution lambdas repository.

### Step 7
Verify your installation, once the tableau service is available