
resource "aws_secretsmanager_secret" "example" {
  name = "example"
  value = "supersecret"
}