# Create a Firehose resource with S3 destination
resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = "lmu_kinesis_firehose_s3"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.firehose_destination_bucket.arn

    cloudwatch_logging_options {
    enabled = true
    log_group_name = aws_cloudwatch_log_group.lmu_kinesis_firehose_s3.name
    log_stream_name = "lmu_kinesis_firehose_s3"
    }
  }
}