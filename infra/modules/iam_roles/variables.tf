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

variable "region" {
  type = string
  description = "Region de AWS"
  default = "us-east-1"
}

variable "account_id" {
  type = string
  description = "ID de la cuenta AWS"
}

variable "kinesis_stream_name" {
  type = string
  description = "Nombre del Kinesis Data Stream"
}