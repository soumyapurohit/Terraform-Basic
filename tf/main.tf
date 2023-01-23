module "sample-lambda" {
  source = "./modules/lambda"
  file_name = "../src/python/sample-lambda/lambda_function.py"
  function_name = "${var.environment}_sample-lambda"
}