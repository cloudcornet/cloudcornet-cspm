# Account.1 - Security contact information should be provided for an AWS account
resource "aws_account_alternate_contact" "this" {
    alternate_contact_type = "SECURITY"
    name                   = var.alternate_contact_security_name
    title                  = var.alternate_contact_security_title
    email_address          = var.alternate_contact_security_email_address
    phone_number           = var.alternate_contact_security_phone_number
}

