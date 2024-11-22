# IAM.10 - IAM.11 - IAM.12 -  IAM.13 - IAM.14 - IAM.15 - IAM.16 - IAM.17
resource "aws_iam_account_password_policy" "this" {
  count = var.enable_iam_account_password_policy ? 1 : 0
  
  # IAM.11 - Ensure IAM password policy requires at least one uppercase letter
  require_uppercase_characters   = var.password_require_uppercase_characters

  # IAM.12 - Ensure IAM password policy requires at least one lowercase letter
  require_lowercase_characters   = var.password_require_lowercase_characters

  # IAM.13 - Ensure IAM password policy requires at least one symbol
  require_symbols                = var.password_require_symbols

  # IAM.14 - Ensure IAM password policy requires at least one number
  require_numbers                = var.password_require_numbers

  # IAM.15 - Ensure IAM password policy requires minimum password length of 14 or greater
  minimum_password_length        = var.password_minimum_length

  # IAM.16 - Ensure IAM password policy prevents password reuse
  password_reuse_prevention      = var.password_reuse_prevention

  # IAM.17 - Ensure IAM password policy expires passwords within 90 days or less
  max_password_age               = var.password_max_age
}
