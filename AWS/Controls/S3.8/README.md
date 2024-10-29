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
aws configservice describe-config-rules \
    --query "ConfigRules[?starts_with(ConfigRuleName, 'securityhub-s3-bucket-level-public-access-prohibited-')].ConfigRuleName" \
    --output text | xargs -I {} aws configservice get-compliance-details-by-config-rule \
    --config-rule-name {} \
    --compliance-types "NON_COMPLIANT" \
    --query "EvaluationResults[].EvaluationResultIdentifier.EvaluationResultQualifier.ResourceId" \
    --output json
```

Note that AWS Config does not check resources in real time, so there may be delays between updated resources and seeing results in AWS Config.

**Step 2** - Update file /AWS/Controls/S3.8/variable.tf with S3 buckets to fix.

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
    --query "ConfigRules[?starts_with(ConfigRuleName, 'securityhub-s3-bucket-level-public-access-prohibited')].ConfigRuleName" \
    --output text)
```

**Step 5**

Wait a few minutes for step 4 to be re-evaluated.

**Step 6**

Check to confirm that you no longer have any non-compliant resources.

```
aws configservice describe-config-rules \
    --query "ConfigRules[?starts_with(ConfigRuleName, 'securityhub-s3-bucket-level-public-access-prohibited-')].ConfigRuleName" \
    --output text | xargs -I {} aws configservice get-compliance-details-by-config-rule \
    --config-rule-name {} \
    --compliance-types "NON_COMPLIANT" \
    --query "EvaluationResults[].EvaluationResultIdentifier.EvaluationResultQualifier.ResourceId" \
    --output json
```
