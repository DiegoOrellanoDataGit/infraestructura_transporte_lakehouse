variable "project_name" {
  description = "Nombre del proyecto"
  type = string
}

variable "environment" {
  description = "Entorno de desarrollo"
  type = string
}

variable "bucket_arn" {
  description = "ARN del bucket S3 del lakehouse"
  type = string
}

variable "glue_database" {
  description = "Nombre de la base de datos de Glue"
  type = string
}