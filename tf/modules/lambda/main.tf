data "archive_file" "zipit" {

  type        = "zip"
  source_file = "../src/python/sample-lambda/lambda_function.py"
  output_path = "lambda_function.zip"

}



resource "aws_lambda_function" "test_lambda" {
    #filename = var.file_name
    filename = data.archive_file.zipit.output_path
    function_name = var.function_name
    handler = "../src/python/sample-lambda/lambda_function.lambda_handler"
    timeout = 8
    runtime = "python3.9"
    role = aws_iam_role.iam_for_lambda.arn
    source_code_hash = "${data.archive_file.zipit.output_base64sha256}"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Action": "sts:AssumeRole",
              "Principal": {
                  "Service": "lambda.amazonaws.com"

              },
              "Effect": "Allow",
              "Sid": ""
          }
      ]
  }
    EOF
}