variable "project_name" {}
variable "aws_region" { default = "eu-west-1" }

# AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
provider "aws" { region = "${var.aws_region}" }

# HEROKU_API_KEY, HEROKU_EMAIL
provider "heroku" {}

# Store Terraform state in S3 (this must be prepared in advance)
terraform {
  backend "s3" {
    bucket = "avoinsorsa-terraform"
    key = "wp/terraform.tfstate"
    region = "eu-west-1"
  }
}

