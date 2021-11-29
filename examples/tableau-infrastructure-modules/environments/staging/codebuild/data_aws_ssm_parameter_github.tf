data "aws_ssm_parameter" "github_oauth_token" {
  name = var.ssm_path_github_token
}
