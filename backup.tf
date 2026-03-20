resource "aws_backup_vault" "vault" {
  name = "gustavo_backup_vault"

  tags = local.common_tags
}

resource "aws_iam_role" "iam_backup" {
  name = "gustavo-aws-backup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "backup.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "backup_policy" {
  role       = aws_iam_role.iam_backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_backup_plan" "ec2_daily" {
  name = "ec2-daily-backup"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.vault.name
    schedule          = "cron(0 5 ? * * *)"
    start_window      = 60
    completion_window = 180

    lifecycle {
      delete_after = 30
    }

    recovery_point_tags = merge(
      local.common_tags,
      {
        BackupType = "daily"
      }
    )
  }

}

resource "aws_backup_selection" "ec2_selection" {
  iam_role_arn = aws_iam_role.iam_backup.arn
  name         = "ec2-backup"
  plan_id      = aws_backup_plan.ec2_daily.id

  resources = [
    aws_instance.ec2_nginx.arn
  ]
}