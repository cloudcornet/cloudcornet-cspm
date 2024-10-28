### SECURITY HUB CONTROL


| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **ID**  | S3.8  |
| **Title**  | S3 general purpose buckets should block public access |
| **AWS**  | [AWS Remediation instructions](https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-8)
| **Cloudcornet**  | Follow below instructions |

**Pre-requisite**
- Install and configure AWS CLI
- Install Terraform
- Security Hub enabled
- AWS Config enabled

**Step 1** - Identity non compliant S3 buckets.

```
aws securityhub get-findings \
    --filters "{\"ComplianceStatus\": [{\"Value\": \"FAILED\", \"Comparison\": \"EQUALS\"}], \"ComplianceSecurityControlId\": [{\"Value\": \"S3.8\", \"Comparison\": \"EQUALS\"}]}" \
    --query "Findings[].Resources[].Id" \
    --output json
 ```

**Step 2** - Update file /AWS/Controls/S3.8/variable.tf with S3 buckets to fix.

**Step 3** - Terraform command.

```
terraform plan
terraform apply
```

**Step 4** - Re-evaluate aws config rule.

```
aws configservice start-config-rules-evaluation \
    --config-rule-names $(aws configservice describe-config-rules \
    --query "ConfigRules[?starts_with(ConfigRuleName, 'securityhub-s3-bucket-level-public-access-prohibited')].ConfigRuleName" \
    --output text)
```



