resource "aws_iam_role" "this" {
  name               = var.name
  description        = ""
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  version = "2012-10-17"

  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.principals
    }
  }
}

resource "aws_iam_policy" "this" {
  name        = var.name
  description = ""
  path        = "/"
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
