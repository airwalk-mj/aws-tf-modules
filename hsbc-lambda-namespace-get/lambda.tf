# Simple AWS Lambda Terraform Example
# requires 'python.py' in the same directory
# to test: run `terraform plan`
# to deploy: run `terraform apply`

data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "main.py"
    output_path   = "lambda_function.zip"
}

resource "aws_lambda_function" "lambda-k8s-namespace-get-meta" {
  filename         = "lambda_function.zip"
  function_name    = "lambda-k8s-namespace-get-meta"
  role             = aws_iam_role.lambda-namespace-get-meta.arn
  handler          = "lambda.get_secret"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.6"
  depends_on       = [aws_iam_role.lambda-namespace-get-meta]
}