
resource "aws_secretsmanager_secret" "example" {
  name = "example"
  depends_on = [aws_kms_key.test]
}