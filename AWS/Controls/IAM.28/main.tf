provider "aws" {
  region = var.aws_region
}

# Account Analyzer
resource "aws_accessanalyzer_analyzer" "this" {
  analyzer_name = var.aws_analyzer_name
}