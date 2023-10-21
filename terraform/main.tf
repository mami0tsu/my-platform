data "aws_iam_role" "terraform_plan" {
  name = "terraform-plan"
}

resource "aws_iam_role" "tmp" {
  name = "tmp"
}
