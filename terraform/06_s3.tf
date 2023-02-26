resource "aws_s3_bucket" "firehose_destination_bucket" {
  bucket = "lmu-firehose-bucket"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.firehose_destination_bucket.id
  acl    = "private"
}