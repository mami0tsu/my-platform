resource "aws_lambda_function" "this" {
  depends_on = [
    aws_cloudwatch_log_group.this,
    null_resource.this,
  ]

  function_name = "${var.stage}-${var.service_name}"
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.this.repository_url}:latest"
  role          = aws_iam_role.lambda.arn
  publish       = true

  memory_size = 128
  timeout     = 3

  environment {
    # FIXME
    # variables = var.secrets
  }

  lifecycle {
    ignore_changes = [
      image_uri,
      last_modified,
    ]
  }
}

resource "aws_lambda_alias" "this" {
  name             = var.stage
  function_name    = aws_lambda_function.this.arn
  function_version = aws_lambda_function.this.version

  lifecycle {
    ignore_changes = [
      function_version,
    ]
  }
}

resource "aws_lambda_permission" "this" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "scheduler.amazonaws.com"
}
