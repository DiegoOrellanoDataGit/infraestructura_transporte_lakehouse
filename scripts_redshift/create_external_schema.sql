-- 01_create_external_schema.sql

CREATE EXTERNAL SCHEMA lakehouse_ext
FROM DATA CATALOG
DATABASE 'lakehouse_db'
IAM_ROLE 'arn:aws:iam::<account_id>:role/redshift_streaming_role'
REGION 'us-east-1';