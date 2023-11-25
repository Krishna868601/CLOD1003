
resource "aws_iam_policy" "policy" {
  name        = "testpolicy"
  path        = "/"
  description = "My test policy"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.example.arn}"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "test-attach" {
    name = "test-attachment"
    users = ["securitycredentials"]
    policy_arn = aws_iam_policy.policy.arn
}