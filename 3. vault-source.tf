resource "aws_backup_vault" "source_vault" {
  provider  = aws.source
  name      = "SourceBackupVault"
}