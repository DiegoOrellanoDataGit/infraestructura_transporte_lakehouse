resource "aws_glue_catalog_database" "lakehouse_db" {
  name = var.database_name
}