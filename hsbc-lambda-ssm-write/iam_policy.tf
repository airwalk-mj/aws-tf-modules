
# Enable Logging
resource "aws_iam_policy" "lambda-ssm-write" {
  name        = "lambda-logging-write-policy"
  description = "A test policy to allow lambda to access the Xray"
  depends_on  = [aws_iam_role.lambda-ssm-write]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
      "Action": [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "secretsmanager:CreateSecret",
          "secretsmanager:TagResource",
          "secretsmanager:PutSecretValue",
          "kms:GenerateDataKey",
          "kms:Decrypt"
      ],
      "Effect": "Allow",
      "Resource": "*"
  },
}
EOF
}

# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.lambda-ssm-write.name
  policy_arn = aws_iam_policy.lambda-ssm-write.arn
}
