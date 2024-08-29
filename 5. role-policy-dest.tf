resource "aws_iam_role" "destination_backup_role" {
  name = "DestinationBackupRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::533266983093:role/CrossAccountBackupRole"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "destination_backup_policy" {
  name        = "DestinationBackupPolicy"
  description = "Policy to allow backup management in the destination account"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "backup:CopyToBackupVault",
          "backup:GetBackupVaultAccessPolicy",
          "backup:GetBackupVaultNotifications",
          "backup:DescribeBackupVault",
          "backup:ListRecoveryPointsByBackupVault",
          "backup:DescribeRecoveryPoint",
          "backup:CreateBackupVault",
          "backup:DeleteRecoveryPoint"
        ],
        Resource = [
          "arn:aws:backup:us-west-2:659721849750:backup-vault/aramos-stage",
          "arn:aws:backup:us-west-2:659721849750:recovery-point/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_destination_backup_policy" {
  role       = aws_iam_role.destination_backup_role.name
  policy_arn = aws_iam_policy.destination_backup_policy.arn
}