# IAM user

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_virtual_mfa_device.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_virtual_mfa_device) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_console"></a> [enable\_console](#input\_enable\_console) | Enable console access | `bool` | `false` | no |
| <a name="input_enable_mfa"></a> [enable\_mfa](#input\_enable\_mfa) | Enable MFA | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of IAM user and group | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | IAM policy attached to role | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Policy name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_initial_password"></a> [initial\_password](#output\_initial\_password) | Initial password |
| <a name="output_qr_code"></a> [qr\_code](#output\_qr\_code) | QR code for setup MFA |
<!-- END_TF_DOCS -->
