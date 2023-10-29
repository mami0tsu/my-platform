#
# IAM user
#
resource "aws_iam_user" "this" {
  name = var.name
  path = "/"
}

resource "aws_iam_user_login_profile" "this" {
  count = var.enable_console ? 1 : 0

  user = aws_iam_user.this.name
}

resource "aws_iam_virtual_mfa_device" "this" {
  count = var.enable_mfa ? 1 : 0

  virtual_mfa_device_name = var.name
  path                    = "/"
}

#
# IAM group
#
resource "aws_iam_group" "this" {
  name = var.name
  path = "/"
}

resource "aws_iam_user_group_membership" "this" {
  user   = aws_iam_user.this.name
  groups = [aws_iam_group.this.name]
}

resource "aws_iam_policy" "assume_role_policy" {
  name        = var.name
  description = ""
  path        = "/"
  policy      = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  version = "2012-10-17"

  statement {
    sid       = ""
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.this.arn]
  }
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.assume_role_policy.arn
}

#
# IAM role
#
resource "aws_iam_role" "this" {
  name               = var.name
  description        = ""
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

data "aws_iam_policy_document" "trust_policy" {
  version = "2012-10-17"

  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.this.arn]
    }
  }
}

resource "aws_iam_policy" "role_policy" {
  name        = var.policy_name
  description = ""
  path        = "/"
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.role_policy.arn
}
