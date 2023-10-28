variable "name" {
  type        = string
  description = "Name of IAM role and policy"
}

variable "policy" {
  type        = string
  description = "IAM policy"
}

variable "principals" {
  type        = list(string)
  description = "List of principal ARNs"
}
