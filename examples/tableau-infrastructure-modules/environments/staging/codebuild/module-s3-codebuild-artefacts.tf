module "codebuilder-tableau-s3" {
  source                  = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/s3"
  s3_bucket_name          = local.s3_codebuild_storage_name
  s3_bucket_force_destroy = true
  s3_bucket_policy        = ""
  common_tags             = var.common_tags
  enable_lifecycle        = false

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
