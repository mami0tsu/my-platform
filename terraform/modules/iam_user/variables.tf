variable "name" {
  type        = string
  description = "Name of IAM user and group"
}

variable "enable_console" {
  type        = bool
  description = "Enable console access"
}

variable "enable_mfa" {
  type        = bool
  description = "Enable MFA"
}

variable "policy_name" {
  type        = string
  description = "Policy name"
}

variable "policy" {
  type        = string
  description = "IAM policy attached to role"
}
