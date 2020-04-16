
resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
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
resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.iam_for_lambda
  policy_arn = aws_iam_policy.policy.arn
}
