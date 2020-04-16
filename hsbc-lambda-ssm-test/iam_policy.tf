
resource "aws_iam_policy" "ssm-policy" {
  name        = "lambda-ssm-policy"
  description = "A test policy to allow lambda to access secrets manager"
  depends_on  = [aws_iam_role.iam_for_lambda]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "secretsmanager:GetSecretValue",
        "ssm:GetParameter*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:ssm:us-east-1:544294979223:parameter/*"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "acm-policy" {
  name        = "lambda-acm-policy"
  description = "A test policy to allow lambda to access the Certificate Manager"
  depends_on  = [aws_iam_role.iam_for_lambda]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "acm:DescribeCertificate",
        "acm:GetCertificate"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kms:us-east-1:544294979223:*"
    }
  ]
}
EOF
}

# Enable Logging
resource "aws_iam_policy" "logging-policy" {
  name        = "lambda-logging-policy"
  description = "A test policy to allow lambda to access the Xray"
  depends_on  = [aws_iam_role.iam_for_lambda]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
      "Effect": "Allow",
      "Action": [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Resource": [
          "*"
      ]
  }
}
EOF
}


# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.ssm-policy.arn
}

# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach2" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.acm-policy.arn
}

# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach4" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.logging-policy.arn
}