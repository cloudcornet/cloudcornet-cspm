variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1" # Update region following your need
}

variable "bucket_names" {
  description = "List of S3 bucket names to apply public access blocks"
  type        = list(string)
  default     = ["bucket-1", "bucket-2"]  # Update bucket names following your needs
}