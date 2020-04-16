
# Enable Logging
resource "aws_iam_policy" "logging-policy" {
  name        = "lambda-logging-policy"
  description = "A test policy to allow lambda to access the Xray"
  depends_on  = [aws_iam_role.lambda-ssm_write]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
      "Action": [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
  }
}
EOF
}

# Enable Secrets access
resource "aws_iam_policy" "ssm-policy_write" {
  name        = "lambda-ssm-policy"
  description = "A test policy to allow lambda to access secrets manager"
  depends_on  = [aws_iam_role.lambda-ssm_write]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "secretsmanager:CreateSecret",
        "secretsmanager:TagResource",
        "secretsmanager:PutSecretValue"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Enable KMS access (to encrypt using CMK)
resource "aws_iam_policy" "kms-policy_write" {
  name        = "lambda-kms-policy"
  description = "A test policy to allow lambda to access the KMS so it can decrypt using CMK"
  depends_on  = [aws_iam_role.lambda-ssm_write]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "kms:GenerateDataKey",
      "kms:Decrypt"
    ],
    "Resource": [
      "arn:aws:kms:us-east-1:544294979223:key/20a7ba6d-7b62-460d-a9ec-6aba8c9cde58"
    ]
  }
}
EOF
}


# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.lambda-ssm_write.name
  policy_arn = aws_iam_policy.logging-policy.arn
}

# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach2" {
  role       = aws_iam_role.lambda-ssm_write.name
  policy_arn = aws_iam_policy.ssm-policy_write.arn
}

# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach3" {
  role       = aws_iam_role.lambda-ssm_write.name
  policy_arn = aws_iam_policy.kms-policy_write.arn
}
