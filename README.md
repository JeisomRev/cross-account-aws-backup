# Terraform Crossaccount AWS Backup

## Overview

This project demonstrates how to use Terraform to automate the creation of a backup to an EBS volume and subsequently copy it to a vault of another account within the same organization.

## Prerequisites

- At least two active AWS accounts with access to the Free Tier in the same AWS organization.
- Terraform installed
- AWS CLI installed and configured

## Setup and Configuration

1. Clone this repository:
`cd crossaccount-backup`

2. Change the `terraform.tfvars` file with your desired values:
```hcl
destination_vault_arn
destination_accounts
source_account_id
aws_organization_id
backup-all-role-arn
```
3. In `1. provider.tf` file change the providers variables (if necessary).

4. In `5. backup-plan.tf` file change the `schedule` variable to a requested value.

5. Initialize Terraform:
`terraform init`

6. Review the execution plan:
`terraform plan`

7. Apply the configuration:
`terraform apply`

8. Cleanup (if necessary):
`terraform destroy`