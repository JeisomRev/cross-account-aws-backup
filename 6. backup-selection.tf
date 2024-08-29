resource "aws_backup_selection" "backup_selection" {
  provider        = aws.source
  name            = "MyBackupSelection"
  #iam_role_arn    = aws_iam_role.cross_account_backup_role.arn
  iam_role_arn    = var.backup-all-role-arn
  plan_id         = aws_backup_plan.backup_plan.id

  resources = [
    aws_ebs_volume.example_volume.arn
  ]
}