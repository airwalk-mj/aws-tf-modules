
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
        "ssm:GetParameter*"
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