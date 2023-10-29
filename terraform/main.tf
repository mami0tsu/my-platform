data "aws_caller_identity" "this" {}

resource "aws_iam_account_alias" "alias" {
  account_alias = local.account_alias
}

module "console_user" {
  source = "./modules/iam_user"

  name        = "console"
  policy_name = "power-user"
  policy      = data.aws_iam_policy_document.power_user.json
}

module "cli_user" {
  source = "./modules/iam_user"

  name        = "cli"
  policy_name = "power-user"
  policy      = data.aws_iam_policy_document.power_user.json
}

data "aws_iam_policy_document" "power_user" {
  version = "2012-10-17"

  statement {
    sid    = ""
    effect = "Allow"
    not_actions = [
      "organizations:*",
      "account:*"
    ]
    resources = ["*"]
  }

  statement {
    sid    = ""
    effect = "Allow"
    actions = [
      "organizations:DescribeOrganization",
      "account:ListRegions",
      "account:GetAccountInformation"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_openid_connect_provider" {
  url             = ""
  client_id_list  = [""]
  thumbprint_list = [""]
}
