resource "aws_iam_user" "this" {
  name = var.name
  path = "/"
}

resource "aws_iam_group" "this" {
  name = var.name
  path = "/"
}

resource "aws_iam_user_group_membership" "this" {
  user   = aws_iam_user.this.name
  groups = [aws_iam_group.this.name]
}

resource "aws_iam_policy" "assume_role" {
  name        = "assume-role-${var.name}"
  description = ""
  path        = "/"
  policy      = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  version = "2012-10-17"

  statement {
    sid       = ""
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${var.account_id}:role/*"]
  }
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.assume_role.arn
}
