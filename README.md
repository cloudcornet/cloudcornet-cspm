
<center><h1>CLOUDCORNET CSPM</h1></center>

<p align="center">
  <img src="https://www.cloudcornet.com/_astro/logo.54I3GuID_1J6Sta.webp">
</p>

Our goal is to help you resolve security findings with a single click.
Our plan includes an end-to-end automated process with full logging, version control, and Infrastructure as Code (IaC) to manage remediations effectively.

**AWS Security Hub Controls**

| ID | Severity | Title | Remediation instructions |
| - | - | - | - |
| IAM.4 | Critical | IAM root user access key should not exist | [Link](AWS/Controls/IAM.4/README.md)
| IAM.15 | Medium | Ensure IAM password policy requires minimum password length of 14 or greater | [Link](AWS/Controls/IAM.15/README.md)
| IAM.16 | Low | Ensure IAM password policy prevents password reuse | [Link](AWS/Controls/IAM.16/README.md)
| IAM.28 | High | IAM Access Analyzer external access analyzer should be enabled | [Link](AWS/Controls/IAM.28/README.md)
| S3.8 | High | S3 general purpose buckets should block public | [Link](AWS/Controls/S3.8/README.md)


# AWS Security Hub Controls (ongoing work)

| Control Id | Title | Severity | Config Rule | Fix | Link |
|------------|-------|----------|-------------|-----|------|
| Account.1 | Security contact information should be provided for an AWS account. | Medium | securityhub-security-account-information-provided-xxxxxxxx | Automated | |
| Account.2 | AWS account should be part of an AWS Organizations organization | High | securityhub-account-part-of-organizations-xxxxxxxx | | |
| | | | | | |
| IAM.1 | IAM policies should not allow full "*" administrative privileges | High | securityhub-iam-policy-no-statements-with-admin-access-ed1dd490 | | |
| IAM.3 | IAM users' access keys should be rotated every 90 days or less | Medium | securityhub-access-keys-rotated-xxxxxxxx | | |
| IAM.4 | IAM root user access key should not exist | Critical | securityhub-iam-root-access-key-check-xxxxxxxx | Manual | |
| IAM.5 | MFA should be enabled for all IAM users that have a console password | Medium | securityhub-mfa-enabled-for-iam-console-access-xxxxxxxx | | |
| IAM.6 | Hardware MFA should be enabled for the root user | Critical | securityhub-root-account-hardware-mfa-enabled-4c5b03f4 | | |
| IAM.7 | Password policies for IAM users should have strong configurations | Medium | securityhub-iam-password-policy-recommended-defaults-xxxxxxxx | Automated | |
| IAM.8 | Unused IAM user credentials should be removed | Medium | securityhub-iam-user-unused-credentials-check-xxxxxxxx | | |
| IAM.9 | MFA should be enabled for the root user | Critical | securityhub-root-account-mfa-enabled-3c663172 | | |
| IAM.10 | Password policies for IAM users should have strong configurations | Medium | securityhub-iam-password-policy-recommended-defaults-no-symbols-required-xxxxxxxx | Automated | |
| IAM.11 | Ensure IAM password policy requires at least one uppercase letter | Medium | securityhub-iam-password-policy-uppercase-letter-check-xxxxxxxx | Automated | |
| IAM.12 | Ensure IAM password policy requires at least one lowercase letter | Medium | securityhub-iam-password-policy-lowercase-letter-check-xxxxxxxx | Automated | |
| IAM.13 | Ensure IAM password policy requires at least one symbol | Medium | securityhub-iam-password-policy-symbol-check-xxxxxxxx | Automated | |
| IAM.14 | Ensure IAM password policy requires at least one number | Medium | securityhub-iam-password-policy-number-check-xxxxxxxx | Automated | |
| IAM.15 | Ensure IAM password policy requires minimum password length of 14 or greater | Medium | securityhub-iam-password-policy-minimum-length-check-xxxxxxxx | Automated | |
| IAM.16 | Ensure IAM password policy prevents password reuse | Low | securityhub-iam-password-policy-prevent-reuse-check-xxxxxxxx | Automated | |
| IAM.17 | Ensure IAM password policy expires passwords within 90 days or less | Low | securityhub-iam-password-policy-ensure-expires-xxxxxxxx | Automated | |
| IAM.18 | Ensure a support role has been created to manage incidents with AWS Support | Low | securityhub-iam-support-policy-in-use-xxxxxxxx | Automated | |
| IAM.19 | MFA should be enabled for all IAM users | Medium | securityhub-iam-user-mfa-enabled-xxxxxxxx | Manual | |
| IAM.20 | This control ID does not exist | | | | |
| IAM.21 | IAM customer managed policies that you create should not allow wildcard actions for services | Low | securityhub-iam-policy-no-statements-with-full-access-xxxxxxxx | | |
| IAM.22 | IAM user credentials unused for 45 days should be removed | Medium | securityhub-iam-user-unused-credentials-check-45-xxxxxxxx | | |
| IAM.23 | IAM Access Analyzer analyzers should be tagged | Low | securityhub-tagged-accessanalyzer-analyzer-xxxxxxxx | Automated | |
| IAM.24 | IAM roles should be tagged | Low | no security rule exist | | |
| IAM.25 | IAM users should be tagged | Low | securityhub-tagged-iam-user-xxxxxxxx | | |
| IAM.26 | Expired SSL/TLS certificates managed in IAM should be removed | Medium | ??? | | |
| IAM.27 | IAM identities should not have the AWSCloudShellFullAccess policy attached | Medium | securityhub-iam-policy-blacklisted-check-xxxxxxxx | | |
| IAM.28 | Access Analyzer external access analyzer should be enabled | High | securityhub-iam-external-access-analyzer-enabled-xxxxxxxx | Automated | |
| | | | | | |
| EC2.7 | EBS default encryption should be enabled | Medium | securityhub-ec2-ebs-encryption-by-default-xxxxxxxx | Automated | |
| | | | | | |
| S3.8 | S3 general purpose buckets should block public access | High | securityhub-s3-bucket-level-public-access-prohibited-xxxxxxxx | Automated | |
| | | | | | |
| GuardDuty.1 | GuardDuty should be enabled | High | securityhub-guardduty-enabled-centralized-xxxxxxxx | Automated | |
| GuardDuty.2 | GuardDuty filters should be tagged | Low | securityhub-tagged-guardduty-filter-xxxxxxxx | | |
| GuardDuty.3 | GuardDuty IPSets should be tagged | Low | securityhub-tagged-guardduty-ipset-xxxxxxxx | | |
| GuardDuty.4 | GuardDuty detectors should be tagged | Low | securityhub-tagged-guardduty-detector-xxxxxxxx | | |
| GuardDuty.5 | GuardDuty EKS Audit Log Monitoring should be enabled | High | securityhub-guardduty-eks-protection-audit-enabled-xxxxxxxx | Automated | |
| GuardDuty.6 | GuardDuty Lambda Protection should be enabled | High | securityhub-guardduty-lambda-protection-enabled-xxxxxxxx | Automated | |
| GuardDuty.7 | GuardDuty EKS Runtime Monitoring should be enabled | Medium | securityhub-guardduty-eks-protection-runtime-enabled-xxxxxxxx | Automated | |
| GuardDuty.8 | GuardDuty Malware Protection for EC2 should be enabled | High | securityhub-guardduty-malware-protection-enabled-xxxxxxxx | Automated | |
| GuardDuty.9 | GuardDuty RDS Protection should be enabled | High | securityhub-guardduty-rds-protection-enabled-xxxxxxxx | Automated | |
| GuardDuty.10 | GuardDuty S3 Protection should be enabled | High | securityhub-guardduty-s3-protection-enabled-xxxxxxxx | Automated | |

Currently, 22 controls are fully automated.
Terraform code will be provided soon—stay tuned, as we update this list nearly every day.

We’ll show you how, right after creating a new account, you can achieve 100% compliance for each security standard enabled in Security Hub.