module "glue_catalog" {
  source = "../../modules/glue_catalog"
  database_name = "lakehouse_prod"
}

module "s3_lakehouse" {
  source = "../../modules/s3_lakehouse"
  project_name = "infraestructura-transporte"
  environment = "prod"
}


module "iam_role" {
  source = "../../modules/iam_roles"
  project_name = "infraestructura-transporte"
  environment = "prod"
  region = var.region
  account_id = var.account_id
  kinesis_stream_name = var.kinesis_stream_name
  bucket_arn = module.s3_lakehouse.s3_bucket_arn
  glue_database = module.glue_catalog.glue_catalog_database_name
}


module "iceberg_table" {
  source = "../../modules/iceberg_tables"
  table_name = "trasporte_table"
  glue_database = module.glue_catalog.glue_catalog_database_name
  bucket_name = module.s3_lakehouse.s3_bucket_name
}

module "redshift" {
  source = "../../modules/redshift"
  admin_password = var.admin_password
  redshift_rola_arn = module.iam_role.redshift_role_arn
}