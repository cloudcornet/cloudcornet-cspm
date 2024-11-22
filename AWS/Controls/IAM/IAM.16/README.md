### SECURITY HUB CONTROL


| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **ID**  | IAM.16  |
| **Title**  | Ensure IAM password policy prevents password reuse |
| **Severity**  | Low  |
| **AWS**  | [AWS Remediation instructions](https://docs.aws.amazon.com/console/securityhub/IAM.16/remediation)
| **Cloudcornet**  | Follow below instructions |

**Pre-requisite**
- Install and configure AWS CLI
- Install Terraform
- Security Hub enabled
- AWS Config enabled

**Step 1** - Check current status

```
aws iam get-account-password-policy            
```

If no password policy is set you should have this as command result.

```
An error occurred (NoSuchEntity) when calling the GetAccountPasswordPolicy operation: The Password Policy with domain name {your-accound-id} cannot be found.
```

If a password policy is already set, you should have something like below.
Check the "PasswordReusePrevention" value and set it to 24 to be compliant.

```
{
    "PasswordPolicy": {
        "MinimumPasswordLength": 24,
        "RequireSymbols": true,
        "RequireNumbers": true,
        "RequireUppercaseCharacters": true,
        "RequireLowercaseCharacters": true,
        "AllowUsersToChangePassword": false,
        "ExpirePasswords": true,
        "MaxPasswordAge": 90,
        "PasswordReusePrevention": 12
    }
}
```

**Step 2** - Update file /AWS/Controls/IAM.16/variable.tf with your inputs.

**Step 3** - Terraform command.

```
terraform init
terraform plan
terraform apply
```

**Step 4** - Re-evaluate aws config rule.

```
aws configservice start-config-rules-evaluation \
    --config-rule-names $(aws configservice describe-config-rules \
    --query "ConfigRules[?starts_with(ConfigRuleName, 'securityhub-iam-password-policy-prevent-reuse-check')].ConfigRuleName" \
    --output text)
```

**Step 5**

Wait a few minutes for step 4 to be re-evaluated.

**Step 6**

Check to confirm that you no longer have any non-compliant resources.

```
aws iam get-account-password-policy     
{
    "PasswordPolicy": {
        "MinimumPasswordLength": 6,
        "RequireSymbols": false,
        "RequireNumbers": false,
        "RequireUppercaseCharacters": false,
        "RequireLowercaseCharacters": false,
        "AllowUsersToChangePassword": true,
        "ExpirePasswords": false,
        "PasswordReusePrevention": 24
    }
}         
```




   

**Remarks**

Some default values are set when you only apply for password reuse.


```
❯ aws iam get-account-password-policy

An error occurred (NoSuchEntity) when calling the GetAccountPasswordPolicy operation: The Password Policy with domain name XXXXXXXXXXXX cannot be found.

❯ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_account_password_policy.this will be created
  + resource "aws_iam_account_password_policy" "this" {
      + allow_users_to_change_password = true
      + expire_passwords               = (known after apply)
      + hard_expiry                    = (known after apply)
      + id                             = (known after apply)
      + max_password_age               = (known after apply)
      + minimum_password_length        = 6
      + password_reuse_prevention      = 24
      + require_lowercase_characters   = (known after apply)
      + require_numbers                = (known after apply)
      + require_symbols                = (known after apply)
      + require_uppercase_characters   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

❯ aws iam get-account-password-policy

An error occurred (NoSuchEntity) when calling the GetAccountPasswordPolicy operation: The Password Policy with domain name 527924061921 cannot be found.
 
❯ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_account_password_policy.this will be created
  + resource "aws_iam_account_password_policy" "this" {
      + allow_users_to_change_password = true
      + expire_passwords               = (known after apply)
      + hard_expiry                    = (known after apply)
      + id                             = (known after apply)
      + max_password_age               = (known after apply)
      + minimum_password_length        = 6
      + password_reuse_prevention      = 24
      + require_lowercase_characters   = (known after apply)
      + require_numbers                = (known after apply)
      + require_symbols                = (known after apply)
      + require_uppercase_characters   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

After apply

```
❯ aws iam get-account-password-policy
{
    "PasswordPolicy": {
        "MinimumPasswordLength": 6,
        "RequireSymbols": false,
        "RequireNumbers": false,
        "RequireUppercaseCharacters": false,
        "RequireLowercaseCharacters": false,
        "AllowUsersToChangePassword": true,
        "ExpirePasswords": false,
        "PasswordReusePrevention": 24
    }
}
```

You cannot go beyond 24 , just a quick test made to see what happen.

```
Error: updating IAM Account Password Policy: operation error IAM: UpdateAccountPasswordPolicy, https response error StatusCode: 400, RequestID: 55bf1e52-1b3d-405e-9060-30e05ac073a3, api error ValidationError: 1 validation error detected: Value at 'passwordReusePrevention' failed to satisfy constraint: Member must have value less than or equal to 24
```