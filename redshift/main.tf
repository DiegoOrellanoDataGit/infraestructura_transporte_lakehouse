resource "aws_redshiftserverless_namespace" "redshift_namespace" {
  namespace_name = "lakehouse-namespace"
  admin_username = "admin"
  admin_user_password = var.admin_password
  iam_roles = [ var.redshift_rola_arn ]

}

resource "aws_redshiftserverless_workgroup" "redshift_workgroup" {
  workgroup_name = "lakehoouse-workgroup"
  namespace_name = aws_redshiftserverless_namespace.redshift_namespace.namespace_name
  base_capacity  = 32

  
}