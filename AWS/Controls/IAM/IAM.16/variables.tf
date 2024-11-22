variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1" # Update this value as needed.
}

variable "aws_password_reuse_prevention" {
  description = "Password reuse prevention"
  type        = number
  default     = 24 # Update this value as needed. The control fails if the value is not 24.
}