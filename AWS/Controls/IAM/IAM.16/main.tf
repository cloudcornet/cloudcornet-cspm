provider "aws" {
  region = var.aws_region
}

resource "aws_iam_account_password_policy" "this" {
  # Enforce password reuse prevention
  password_reuse_prevention  = var.aws_password_reuse_prevention # Set the number of previous passwords to remember (1-24)
}