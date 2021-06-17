# Using the tableau-deployment skeleton terraform directory
This repo is to get you started using the OSO standalone reusable Tableau deployment module

We publish this structure publicly so you can see how you might integrate it into your infrastructure, but to see the modules to which it refers, you must purchase the module

If you're already purchased this module, please refer to the full deployment guide at: <https://github.com/osodevops/aws-terraform-module-tableau/deployment_guide.md>.

If you're interested in using our re-usable Tableau deployment, contact us at <enquiries@osodevops.io> or <https://osodevops.io/> for more information.

To configure the structure for use, follow the README.md files in the directories in order, and refer to the deployment guide document.

# Scope of responsibilities
The module is responsible for creating and maintaining the infrastructure required to stand-up Tableau abd keep it operational. By default it does not configure any Tableau integrations or data sources.

The clustering lambda can be used to maintain cluster membership on an ongoing basis, and supports adding additional "worker" nodes with the default Tableau role. You may also use it simply to stand up new clusters.

Note that the clustering lambda does not currently support replacing the "initial" node of a running cluster.

In general, a deployment provides the following
- Backup and restore of the Tableau internal database to/from S3
- Cloudwatch alarms that monitor service availability
- Security configuration
- A running Tableau installation incorporating licenses uploaded to Parameter Store

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

# Deploying Tableau

### Step 1
Create AWS pre-requisites

These should include
- An AWS account
- An internal or external domain that can be used for Tableau DNS entries
- A wildcard ACM certificate for use with the Tableau load-balancers
- Unprivileged engineering IAM roles
- A privileged Terraform IAM role
- Bootstrap S3 and DynamoDB configuration for Terraform (which OSO can provide on request)
- (Optional) A pre-defined VPC. You can choose to include the OSO VPC module, which will configure tags and subnets as required

### Step 2
Import the OSO solution modules into your codebase

The solution consists of high-level modules as represented in repository, and low-level modules form the backbone of the solution.

The included structure is only an example, and you choose to structure / position the high-level modules as you see fit.

Be aware there are dependencies between the modules which are modelled through data lookups based on naming-conventions and tags.

Module dependencies are:
- `vpc` > `codebuild`
- `vpc` > `tableau-cluster / tableau-standalone`
- `backup-bucket` > `tableau-cluster / tableau-standalone`
- `tableau-standalone` > `dns-selector`

Part of importing the code will be defining the name of your environment. e.g. `testing`.

### Step 3
Once you know which style of deployment you want, configure each of the required modules.
- `backup-bucket`
- `codebuild`
- `dns-selector`
- `tableau-cluster` or `tableau-standalone`
- `vpc`

Individual README files are available within each module to explain the options.

### Step 4
Start applying Terraform

Configure and apply the following Terraform modules:
- vpc
- backup-bucket
- codebuild

### Step 5
Create the Tableau AMI by executing the CodeBuild project created in the previous step

To do this, perform the following:
- Log in to the AWS Console
- Navigate to CodeBuild
- Locate the "tableau" project
- Click `build now`

An AMI build takes approximately 20 minutes

## Standlone only
### Step 6 (standalone)
Apply the `tableau-standalone` Terraform module

========= **You're done** =========

The cluster will now deploy and you can view the state of the cluster in either the TSM UI on port 8850 on the initial instance, or logging on to the cluster with the default administration account.

## Blue/Green only
### Step 6 (blue/green)
Apply the `tableau-standalone` Terraform module in the blue and green sub-directories.

Be aware that you will need to add `../` to the Terraform init and apply commands.

### Step 7 (blue/green)
Configure and apply the `dns-selector` Terraform module. This module allows you to specify either `blue` or `green` as the selected Tableau cluster.

========= **You're done** =========

The cluster will now deploy and you can view the state of the cluster in either the TSM UI on port 8850 on the initial instance, or logging on to the cluster with the default administration account.

## Clustering only
### Step 6 (clustering)
For the `tableau-cluster` module, set the following items in `terraform.tfenv`
- enable_lambdas: false
- create_lambdas: false
- cluster_size: 0

These settings prevent the cluster from being spun up until we have build and deployed the configuration and termination lambda contents

Apply the `tableau-cluster` module

### Step 7 (clustering)
Build and deploy the lambda code

The previous step will have created an S3 bucket of the form `<account alias>-<region>-<environment>-lambda-artefacts`

In order to build and upload the code, change directory to the location you copied the OSO lambda code to in your codebase. Execute the upload script bundled with the code:

This example assumes an account with sufficient privileges on the target S3 bucket
```shell
$ cd tableau-cluster-lambdas
$ ./scripts/build-function.sh  -b <YOUR BUCKET NAME HERE> -f service_configurator
$ ./scripts/build-function.sh  -b <YOUR BUCKET NAME HERE> -f instance_terminator
```

Further details are in the OSO solution lambdas repository. (git@github.com:osodevops/tableau-cluster-lambdas.git)

### Step 8 (cluster)
Set the parameters you modified in Step 6 to their final values:
- enable_lambdas: true
- create_lambdas: true
- cluster_size: <YOUR DESIRED CLUSTER SIZE>

Apply the `tableau-cluster` module

========= **You're done** =========

The cluster will now deploy and you can view the state of the cluster in either the TSM UI on port 8850 on the initial instance, checking the DynamoDB configuration tables, or logging on to the cluster with the default administration account. 
