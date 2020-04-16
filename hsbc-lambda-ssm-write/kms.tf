
resource "aws_kms_key" "test" {
  description             = "kms test key2"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "test" {
  name          = "alias/mule/policy/secret_key2"
  target_key_id = aws_kms_key.test.key_id
}
