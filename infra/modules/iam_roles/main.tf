resource "aws_iam_role" "flink_role" {
  name = "${var.project_name}-${var.environment}-flink-role"
  assume_role_policy = data.aws_iam_policy_document.flink_assume_role.json
}

data "aws_iam_policy_document" "flink_assume_role" {
  statement {
    actions = [ "sts:AssumeRole" ]
    principals {
      type = "Service"
      identifiers = [ "ec2.amazonaws.com","ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "flink_policy" {
  role = aws_iam_role.flink_role.id
  policy = jsonencode(
       {
         Version = "2012-10-17",
         Statement = [{
            Effect = "Allow",
            Action = [
                    "glue:GetTable",
                    "glue:UpdateTable",
                    "glue:CreateTable",
                    "s3:PutObject",
                    "s3:GetObject",
                    "s3:ListBucket"
            ]
            Resource = [
                var.bucket_arn,
                "${var.bucket_arn}/*",
                "arn:aws:glue:*:*:database/${var.glue_database}"
            ]
         }]
       }


  )
}


resource "aws_iam_role" "redshift_role" {
  name = "${var.project_name}-${var.environment}-redshift-role"

  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement =[{
        Effect ="Allow"
        Principal = {
          Service = "redshift.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }]
    }
  )
}

resource "aws_iam_role_policy" "redshift_policy" {
  role = aws_iam_role.redshift_role.id

  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action =[
            "kinesis:GetRecords",
            "kinesis:GetShardIterator",
            "kinesis:DescribeStream"
          ]
          Resource = "arn:aws:kinesis:${var.region}:${var.account_id}:stream/${var.kinesis_stream_name}"
      },
        {
          Effect ="Allow"
          Action = [
          "glue:GetDatabase",
          "glue:GetTable",
          "glue:GetPartitions"
          ]
          Resource = "*"
        }
      ]
    }
  )
}