output "redshift_workgroup_name" {
  value = aws_redshiftserverless_workgroup.redshift_workgroup
}

output "redshift_namespace_name" {
  value = aws_redshiftserverless_namespace.redshift_namespace
}
