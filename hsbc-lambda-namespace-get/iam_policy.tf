
resource "aws_iam_policy" "lambda-namespace-get-meta" {
  name        = "lambda-namespace-get-meta-policy"
  description = "A test policy to allow lambda to query a K8s namespace for metadata"
  depends_on  = [aws_iam_role.lambda-namespace-get-meta]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
      "Action": [
        "sts:GetCallerIdentity",
        "eks:DescribeCluster",
      ],
      "Effect": "Allow",
      "Resource": "*"
  }
}
EOF
}
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.lambda-namespace-get-meta.name
  policy_arn = aws_iam_policy.lambda-namespace-get-meta.arn
}