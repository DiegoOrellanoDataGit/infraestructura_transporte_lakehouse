resource "aws_glue_catalog_table" "iceberg_table" {
  name = var.table_name
  database_name = var.glue_database

  table_type = "EXTERNAL TABLE"

  parameters = {
    table_type = "ICEBERG"
    write_target_data_file_format = "parquet"
    write_target_manifest_file_format = "avro"
    write_target_metadata_file_format = "avro"
  }

  storage_descriptor {
    location = "s3://${var.bucket_name}/${var.table_name}/"
    input_format = "org.apache.iceberg.mr.hive.HiveIcebergInputFormat"
    output_format = "org.apache.iceberg.mr.hive.HiveIcebergOutputFormat"

    ser_de_info {
      name = var.table_name
      serialization_library = "org.apache.iceberg.mr.hive.HiveIcebergSerDe"
    }

    columns {
      name = "id_transporte"
      type = "string"
    }

    columns {
      name = "fecha_evento"
      type = "timestamp"
    }
    columns {
      name = "ubicacion"
      type = "string"
    }
  }

  
}