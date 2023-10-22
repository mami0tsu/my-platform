resource "aws_scheduler_schedule_group" "this" {
  name = "${var.stage}-${var.service_name}"
}

resource "aws_scheduler_schedule" "this" {
  name       = "${var.stage}-${var.service_name}"
  group_name = aws_scheduler_schedule_group.this.name

  state                        = "ENABLED"
  schedule_expression          = "cron(0 09 * * ? *)"
  schedule_expression_timezone = "Asia/Tokyo"

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = aws_lambda_function.this.arn
    role_arn = aws_iam_role.eventbridge.arn

    retry_policy {
      maximum_event_age_in_seconds = 60
      maximum_retry_attempts       = 0
    }
  }
}
