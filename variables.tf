variable "aws_organization_id" {
  description = "AWS OU ID"
  type        = string
}

variable "source_account_id" {
  description = "AWS account ID from will be copied the backups"
  type        = string
}

variable "destination_accounts" {
  description = "List of AWS account IDs where will be copied the backups"
  type        = string
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 8
}

variable "ebs_volume_type" {
  description = "Type of EBS volume"
  type        = string
  default     = "gp2"
}

variable "availability_zone" {
  description = "Avialability zone for the EBS volume"
  type        = string
  default     = "us-west-2a"
}

variable "destination_vault_arn" {
  description = "The ARN of the destination backup vault where copies of backups will be stored."
  type        = string
}

variable "organizational_unit_id" {
  description = "The ID of the Organizational Unit (OU) to attach the SCP to."
  type        = string
  default     = ""  # Set to the actual OU ID if it exists, or leave empty if creating a new OU
}

variable "parent_id" {
  description = "The ID of the parent organizational unit or root where the new OU should be created."
  type        = string
  default     = "r-qocl"
}

variable "backup-all-role-arn" {
  description = "ARN of Backup full access role"
  type        = string
}