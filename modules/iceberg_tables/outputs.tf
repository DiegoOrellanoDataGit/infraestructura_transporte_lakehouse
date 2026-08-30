output "iceberg_table_name" {
  description = "Nombre de la tabla de Iceberg creada"
  value = aws_glue_catalog_table.iceberg_table.name
}