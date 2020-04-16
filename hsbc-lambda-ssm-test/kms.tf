
resource "aws_kms_key" "test" {
  description             = "kms test key"
  deletion_window_in_days = 10
}
