output "glue_catalog_database_name" {
  description = "Nombre de la base de datos creada en Glue"
  value = aws_glue_catalog_database.lakehouse_db.name
}