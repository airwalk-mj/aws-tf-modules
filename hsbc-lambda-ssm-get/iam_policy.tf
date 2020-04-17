
resource "aws_iam_policy" "lambda-ssm-get" {
  name        = "lambda-ssm-get-policy"
  description = "A test policy to allow lambda to rerieve encrypted secrets from Secrets Manager"
  depends_on  = [aws_iam_role.lambda-ssm-put]
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
          "ssm:GetParameters",
          "secretsmanager:GetSecretValue",
          "kms:DescribeKey",
          "kms:Decrypt"
      ],
      "Effect": "Allow",
      "Resource": "*"
  }
}
EOF
}
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.lambda-ssm-get.name
  policy_arn = aws_iam_policy.lambda-ssm-get.arn
}



resource "aws_iam_policy" "acm-policy-get" {
  name        = "lambda-acm-read-policy"
  description = "A test policy to allow lambda to access the Certificate Manager"
  depends_on  = [aws_iam_role.lambda-ssm-get]
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
      "Resource": "*"
    }
  ]
}
EOF
}
