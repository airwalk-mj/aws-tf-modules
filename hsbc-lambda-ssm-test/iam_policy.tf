
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
        "secretsmanager:GetSecretValue"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:ssm:us-east-1:544294979223:parameter/*"
    }
  ]
}
EOF
}
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.ssm-policy.arn
}


resource "aws_iam_policy" "kms-policy" {
  name        = "lambda-kms-policy"
  description = "A test policy to allow lambda to access the KMS keys"
  depends_on  = [aws_iam_role.iam_for_lambda]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ssm:GetParameter*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kms:us-east-1:544294979223:*"
    }
  ]
}
EOF
}
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach2" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.kms-policy.arn
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
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach2" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.acm-policy.arn
}


# Enable X-Ray
resource "aws_iam_policy" "xray-policy" {
  name        = "lambda-xray-policy"
  description = "A test policy to allow lambda to access the Xray"
  depends_on  = [aws_iam_role.iam_for_lambda]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
      "Effect": "Allow",
      "Action": [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords"
      ],
      "Resource": [
          "*"
      ]
  }
}
EOF
}
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach3" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.xray-policy.arn
}



# Attach CloudFormation Managed policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach4" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.kms-policy.arn
}