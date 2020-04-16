
resource "aws_secretsmanager_secret" "example" {
  name = "example"
  kms_key_id = aws_kms_key.test.id
  depends_on = [aws_kms_key.test]
}