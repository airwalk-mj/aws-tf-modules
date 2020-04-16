
resource "aws_kms_key" "mule" {
  description             = "mule policy key"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "mule" {
  name          = "alias/mule-policy-key"
  target_key_id = aws_kms_key.mule.key_id
}
