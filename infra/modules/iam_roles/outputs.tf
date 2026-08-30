output "flink_role_name" {
  description = "Nombre del rol IAM para flink"
  value = aws_iam_role.flink_role.name
}

output "flink_role_arn" {
  description = "ARN del rol IAM para flink"
  value = aws_iam_role.flink_role.arn
}