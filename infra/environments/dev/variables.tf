variable "account_id" {
  type        = string
  description = "ID de la cuenta AWS"
}

variable "region" {
  type        = string
  description = "Región AWS"
  default     = "us-east-1"
}

variable "kinesis_stream_name" {
  type        = string
  description = "Nombre del Kinesis Data Stream"
}

variable "admin_password" {
  type        = string
  description = "Password del admin de Redshift"
  sensitive   = true
}
