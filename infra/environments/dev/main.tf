module "glue_catalog" {
  source = "../../modules/glue_catalog"
  database_name = "lakehouse_dev"
}

module "s3_lakehouse" {
  source = "../../modules/s3_lakehouse"
  project_name = "infraestructura-data-lakehouse"
  environment = "dev"
}


module "iam_role" {
  source = "../../modules/iam_roles"
  project_name = "infraestructura-transporte"
  environment = "dev"
  bucket_arn = module.s3_lakehouse.s3_bucket_arn
  glue_database = module.glue_catalog.glue_catalog_database_name
}

module "iceberg_table" {
  source = "../../modules/iceberg_tables"
  table_name = "trasporte_table"
  glue_database = module.glue_catalog.glue_catalog_database_name
  bucket_name = module.s3_lakehouse.s3_bucket_name
}