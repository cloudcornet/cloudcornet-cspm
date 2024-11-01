
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