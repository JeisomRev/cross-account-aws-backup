resource "aws_backup_plan" "backup_plan" {
  provider            = aws.source
  name                = "CrossAccountBackupPlan"

  rule {
    rule_name         = "DailyBackup"
    target_vault_name = aws_backup_vault.source_vault.name
    schedule          = "cron(40 21 * * ? *)"
    #start_window      = 120
    #completion_window = 360

    lifecycle {
      delete_after = 35
    }

    copy_action {
      destination_vault_arn = var.destination_vault_arn
      lifecycle {
        delete_after = 35
      }
    }
  }
}