locals {
  stage = "prd"
}

variable "TFC_AWS_PLAN_ROLE_ARN" {
  type      = string
  sensitive = true
}

variable "TFC_AWS_PROVIDER_AUTH" {
  type = bool
}
