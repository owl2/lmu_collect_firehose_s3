## Roles
resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role"

  assume_role_policy = local.firehose_assumerole
}
 
## Policies
resource "aws_iam_policy" "firehose_policy" {
  name        = "test_policy"
  description = "Policy to run kinesis Firehose delivery to S3"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = local.lmu_firehose_s3_policy
}

resource "aws_iam_role_policy_attachment" "lmu_firehose_s3" {
  role       = aws_iam_role.firehose_role.name
  policy_arn = aws_iam_policy.firehose_policy.arn
}

