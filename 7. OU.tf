resource "aws_organizations_organizational_unit" "example_OU" {
  provider  = aws.source
  name      = "example_OU"
  parent_id = var.parent_id
}

resource "aws_organizations_policy_attachment" "backup_policy_attachment" {
  provider  = aws.source
  policy_id = aws_organizations_policy.backup_policy.id
  target_id = aws_organizations_organizational_unit.example_OU.id
}

resource "aws_organizations_policy" "backup_policy" {
  provider    = aws.source
  name        = "OUPolicy"
  description = "Allow copy into backup vault"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateSnapshot",
          "ec2:DescribeTags",
          "ec2:DescribeVolumes",
          "ec2:DeleteSnapshot",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeSnapshots",
          "backup:StartBackupJob",
          "backup:ListBackupJobs",
          "backup:DescribeBackupJob",
          "backup:ListBackupPlans",
          "backup:ListBackupVaults",
          "backup:GetBackupVaultAccessPolicy",
          "backup:GetBackupVaultNotifications",
          "backup:ListRecoveryPointsByBackupVault",
          "backup:ListBackupSelections",
          "backup:DescribeBackupVault",
          "backup:DescribeBackupPlan",
          "backup:ListBackupJobs",
          "backup:ListBackupPlanTemplates",
          "backup:ListBackupVaults",
          "backup:ListBackupPlans",

          "backup:CopyIntoBackupVault",
          "backup:StartCopyJob"
        ]
        Resource = "*"
      }
    ]
  })
}