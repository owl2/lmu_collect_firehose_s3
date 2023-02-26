resource "aws_cloudwatch_log_group" "lmu_kinesis_firehose_s3" {
  name = "lmu_kinesis_firehose_s3"

  tags = {
  }
}

resource "aws_cloudwatch_log_stream" "lmu_kinesis_firehose_s3" {
  name           = "lmu_kinesis_firehose_s3"
  log_group_name = aws_cloudwatch_log_group.lmu_kinesis_firehose_s3.name
}