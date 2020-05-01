
resource "aws_iam_policy" "dtme-assume-shp-iam-role" {
  name        = "lambda-namespace-get-meta-policy"
  description = "Allow DTME resource to assume SHP IAM Role"
  depends_on  = [aws_iam_role.dtme-assume-shp-iam-role]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Resource": "*"
  }
}
EOF
}
# Attach this policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.dtme-assume-shp-iam-role.name
  policy_arn = aws_iam_policy.dtme-assume-shp-iam-role.arn
}