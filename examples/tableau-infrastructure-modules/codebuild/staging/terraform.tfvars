# aws_region = "<YOUR REGION>"
# environment = "<YOUR ENVIRONMENT NAME>"
# github_token = "<YOUR GITHUB TOKEN>"

# Choose your source distribution here: Amazon Linux 2: "amazon.json" or Centos 7: "centos.json"
packer_file_location = "ami/packfiles/amazon.json"

project_name = "tableau"
source_repository_url = "https://github.com/osodevops/aws-terraform-module-tableau"
encrypt_ami = true
packer_vars_file_location = "ami/environment/default.json"
common_tags = {
  Application = "CodeBuild"
  CostCode = "tableau-ami"
  StackVersion = "1.0"
}
