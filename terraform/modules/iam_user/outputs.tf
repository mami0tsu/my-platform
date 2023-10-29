output "initial_password" {
  value       = var.enable_console ? aws_iam_user_login_profile.this[0].encrypted_password : null
  description = "Initial password"
  sensitive   = true
}

output "qr_code" {
  value       = var.enable_mfa ? aws_iam_virtual_mfa_device.this[0].qr_code_png : null
  description = "QR code for setup MFA"
  sensitive   = true
}
