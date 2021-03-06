# Simple AWS Lambda Terraform Example
# requires 'python.py' in the same directory
# to test: run `terraform plan`
# to deploy: run `terraform apply`

data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "lambda.py"
    output_path   = "lambda_function.zip"
}

resource "aws_lambda_function" "ssm-get-secret" {
  filename         = "lambda_function.zip"
  function_name    = "ssm-get-secret"
  role             = aws_iam_role.lambda-ssm-get.arn
  handler          = "lambda.get_secret"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.6"
  depends_on       = [aws_iam_role.lambda-ssm-get]
}