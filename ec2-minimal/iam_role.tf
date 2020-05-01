
resource "aws_iam_role" "dtme-assume-shp-iam-role" {
  name = "dtme-assume-shp-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole"
  }
}
EOF
}