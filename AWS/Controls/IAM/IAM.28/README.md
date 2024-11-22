### SECURITY HUB CONTROL


| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **ID**  | IAM.28  |
| **Title**  | IAM Access Analyzer external access analyzer should be enabled |
| **Severity**  | High  |
| **AWS**  | [AWS Remediation instructions](https://docs.aws.amazon.com/console/securityhub/IAM.28/remediation)
| **Cloudcornet**  | Follow below instructions |

**Pre-requisite**
- Install and configure AWS CLI
- Install Terraform
- Security Hub enabled
- AWS Config enabled

**Step 1** - Check that IAM Access Analyser external is not yet enabled

```
aws accessanalyzer list-analyzers --query "analyzers[?status == 'ACTIVE'].name" --output json
```

Note that AWS Config does not check resources in real time, so there may be delays between updated resources and seeing results in AWS Config.

**Step 2** - Update file /AWS/Controls/IAM.28/variable.tf with variable names you want.

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
    --query "ConfigRules[?starts_with(ConfigRuleName, 'securityhub-iam-external-access-analyzer-enabled')].ConfigRuleName" \
    --output text)
```

**Step 5**

Wait a few minutes for step 4 to be re-evaluated.

**Step 6**

Check to confirm that you no longer have any non-compliant resources.

```
aws accessanalyzer list-analyzers --query "analyzers[?status == 'ACTIVE'].name" --output json
```