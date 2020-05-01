
resource "aws_iam_role" "ec2" {
  name = "dtme-assume-shp-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Sid": "dtme-assume-shp-iam-role"
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
  }
}
EOF
}