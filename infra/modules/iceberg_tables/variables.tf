variable "table_name" {
  description = "Nombre de la tabla de Iceberg"
  type = string
}

variable "glue_database" {
  description = "Nombre de la base de datos en Glue"
  type = string
}

variable "bucket_name" {
  description = "Nombre del bucket S3 deonde se almacenan los datos del iceberg"
  type = string
}