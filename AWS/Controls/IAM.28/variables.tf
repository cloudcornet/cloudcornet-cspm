variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1" # Update following your need
}

variable "aws_analyzer_name" {
  description = "Analyzer name"
  type        = string
  default     = "access_analyzer" # Update following your need
}