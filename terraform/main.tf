data "aws_caller_identity" "this" {}

resource "aws_iam_account_alias" "alias" {
}

#
# IAM User
#
resource "aws_iam_user" "console" {
  name = "console"
  path = "/"
}

resource "aws_iam_group" "console" {
  name = "console"
  path = "/"
}

resource "aws_iam_user_group_membership" "console" {
  user   = aws_iam_user.console.name
  groups = [aws_iam_group.console.name]
}

resource "aws_iam_policy" "assume_role_console" {
  name        = "assume-role-console"
  description = ""
  path        = "/"
  policy      = data.aws_iam_policy_document.assume_role_policy_4_console_group.json
}

data "aws_iam_policy_document" "assume_role_policy_4_console_group" {
  version = "2012-10-17"

  statement = {
    sid       = ""
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["${aws_iam_role.console.arn}"]
  }
}

resource "aws_iam_group_policy_attachment" "assume_role_2_console_group" {
  group      = aws_iam_group.console.name
  policy_arn = aws_iam_policy.assume_role_console.arn
}
