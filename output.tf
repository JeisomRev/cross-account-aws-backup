output "source_backup_vault_arn" {
  description = "ARN of the Backup Vault in the origin account"
  value       = aws_backup_vault.source_vault.arn
}

output "ebs_volume_id" {
  description = "ID of the EBS volume created"
  value       = aws_ebs_volume.example_volume.id
}

output "plan_id" {
  description = "ID of the backup plan"
  value       = aws_backup_plan.backup_plan.id
}

output "backup_role_arn" {
  description = "ARN of the IAM role used by the backup"
  value       = aws_iam_role.cross_account_backup_role.arn
}

output "ebs_volume_arn" {
  description = "The ARN of the EBS volume"
  value       = aws_ebs_volume.example_volume.arn
}