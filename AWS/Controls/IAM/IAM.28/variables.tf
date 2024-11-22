variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1" # Update this value as needed.
}

variable "aws_analyzer_name" {
  description = "Analyzer name"
  type        = string
  default     = "access_analyzer" # Update this value as needed.
}