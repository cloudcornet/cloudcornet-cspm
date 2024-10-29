### SECURITY HUB CONTROL


| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **ID**  | IAM.4  |
| **Title**  | IAM root user access key should not exist |
| **AWS**  | [AWS Remediation instructions](https://docs.aws.amazon.com/console/securityhub/IAM.4/remediation)
| **Cloudcornet**  | Follow below instructions |

**Pre-requisite**
- Install and configure AWS CLI

Do note that AWS does not allow listing or managing root user access keys directly via the AWS CLI or SDKs due to security best practices. 
Root access key management, including listing, creating, or deleting root access keys, must be performed manually through the AWS Management Console.

**Step 1** - Identity non compliant IAM root user access keys.

```
aws iam get-account-summary --query "SummaryMap.AccountAccessKeysPresent" --output text
```

If the result is 1, it indicates that root access keys are present. 
To view or manage the root access keys, you will need to log into the AWS Management Console as the root user, as AWS restricts CLI access to root key details for security reasons.

If the result is 0, it indicates that no root access keys are present.

From Step 2, all the below steps need to be done using the AWS Managment Console.

**Step 2** - Open the [AWS Management Console](https://console.aws.amazon.com/)

**Step 3** - On the IAM user sign in page , choose *Sign in using root user email*

**Step 4** - Fill in the field *Root user email address* with the root email and submit Next button

**Step 5** - Fill in the field *Password* with root password

**Step 6** - Optional

Select your MFA device if you have set one before.

**Step 7** - Once signed in, go to [My security credentials](https://us-east-1.console.aws.amazon.com/iam/home#/security_credentials) and delete any Access keys you may have.

**Step 8** - Check to confirm that you no longer have any non-compliant resources.

```
aws iam get-account-summary --query "SummaryMap.AccountAccessKeysPresent" --output text
```

You should have as result 0.

