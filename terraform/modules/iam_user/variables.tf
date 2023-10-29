variable "name" {
  type        = string
  description = "Name of IAM user and group"
}

variable "policy_name" {
  type        = string
  description = "Policy name"
}

variable "policy" {
  type        = string
  description = "IAM policy attached to role"
}
