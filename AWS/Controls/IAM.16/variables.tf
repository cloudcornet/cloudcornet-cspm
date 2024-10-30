variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1" # Update following your need
}

variable "aws_password_reuse_prevention" {
  description = "Password reuse prevention"
  type        = number
  default     = 24 # Update following your need. The control fails if the value is not 24.
}