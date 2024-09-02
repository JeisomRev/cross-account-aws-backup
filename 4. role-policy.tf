resource "aws_iam_role" "cross_account_backup_role" {
  name = "CrossAccountBackupRole"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "backup.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
}


resource "aws_iam_role_policy" "cross_account_backup_policy" {
  name   = "CrossAccountBackupPolicy"
  role   = aws_iam_role.cross_account_backup_role.id
  policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateSnapshot",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes",
        "ec2:DeleteSnapshot",
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:DescribeSnapshots",
        "ec2:DescribeVolumesModifications",
        "ec2:ModifyVolume"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "backup:CreateBackupPlan",
        "backup:CreateBackupSelection",
        "backup:CreateBackupVault",
        "backup:DeleteBackupPlan",
        "backup:DeleteBackupVault",
        "backup:DeleteRecoveryPoint",
        "backup:DescribeBackupPlan",
        "backup:DescribeBackupJob",
        "backup:DescribeBackupVault",
        "backup:GetBackupVaultAccessPolicy",
        "backup:GetBackupVaultNotifications",
        "backup:ListBackupPlans",
        "backup:ListBackupVaults",
        "backup:ListBackupJobs",
        "backup:ListBackupSelections",
        "backup:ListRecoveryPointsByBackupVault",
        "backup:StartBackupJob",
        "backup:StartCopyJob",
        "backup:CopyIntoBackupVault",
        "backup:ShareRecoveryPoint",
        "backup:TagResource",
        "backup:UntagResource",
        "backup:UpdateRecoveryPointLifecycle",
        "backup:PutBackupVaultAccessPolicy",
        "backup:PutBackupVaultNotifications",
        "backup:CopyIntoBackupVault",
        "backup:StartCopyJob"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "events:PutRule",
        "events:PutTargets",
        "events:DescribeRule",
        "events:DeleteRule",
        "events:ListRules",
        "events:ListTargetsByRule"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "*"
    }
  ]
})
}
