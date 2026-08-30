# Pre-entrega 5: Pipeline Lakehouse con Iceberg, Glue y Catálogo

## 🎯 Objetivo
Configurar la **persistencia transaccional** del pipeline de streaming.  
Los datos procesados por Flink se almacenan como **tablas de Apache Iceberg**, registradas y gobernadas en el **AWS Glue Data Catalog**.

---

## 📂 Estructura del proyecto

infra/
├── environments/
│   ├── dev/
│   │   └── main.tf
│   └── prod/
│       └── main.tf
├── modules/ -- cada modulo tiene su archivo main, variables y outputs
│   ├── glue_catalog/
│   ├── s3_lakehouse/
│   ├── iam_roles/
│   └── iceberg_tables/
app/
└── src/
└── FlinkIcebergLakehouseJob.java --el archivo antes se llamaba script


---

## ⚙️ Infraestructura con Terraform

1. **Glue Catalog Database**  

   resource "aws_glue_catalog_database" "lakehouse_db" {
     name = "lakehouse_dev"
   }

2. **S3 Lakehouse Bucket**

Nombre: infraestructura-transporte-<env>-lakehouse

Versionado habilitado (recomendado para Iceberg).

3. **IAM Roles**

Permisos:

glue:GetTable, glue:UpdateTable, glue:CreateTable

s3:PutObject, s3:GetObject, s3:ListBucket

4. **Tabla Iceberg en Glue**

Nombre: transporte_table

Esquema:

id_transporte STRING

fecha_evento TIMESTAMP

ubicacion STRING

Particionada por fecha_evento.

# 🚀 Implementación en Flink#

**Dependencias**

flink-streaming-java

iceberg-flink-runtime

iceberg-aws

