################################################################################
# IAM Controls
################################################################################

variable "enable_iam_account_password_policy" {
  type = bool
  default = false # Update this value as needed.
}

# IAM.11 - Ensure IAM password policy requires at least one uppercase letter
variable "password_require_uppercase_characters" {
  type    = bool
  default = true # Update this value as needed.
}

# IAM.12 - Ensure IAM password policy requires at least one lowercase letter
variable "password_require_lowercase_characters" {
  type    = bool
  default = true # Update this value as needed.
}

# IAM.13 - Ensure IAM password policy requires at least one symbol
variable "password_require_symbols" {
  type    = bool
  default = true # Update this value as needed.
}

# IAM.14 - Ensure IAM password policy requires at least one number
variable "password_require_numbers" {
  type    = bool
  default = true # Update this value as needed.
}

# IAM.15 - Ensure IAM password policy requires minimum password length of 14 or greater
variable "password_minimum_length" {
  type    = number
  default = 14 # Update this value as needed.
}

# IAM.16 - Ensure IAM password policy prevents password reuse
variable "password_reuse_prevention" {
  type    = number
  default = 24 # Update this value as needed.
}

# IAM.17 - Ensure IAM password policy expires passwords within 90 days or less
variable "password_max_age" {
  type    = number
  default = 90 # Update this value as needed.
}

