## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lightsail_instance.lightsail_instance](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/lightsail_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | availability zone | `any` | n/a | yes |
| <a name="input_bundle_id"></a> [bundle\_id](#input\_bundle\_id) | bundle id | `any` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | lightsail instance name | `any` | n/a | yes |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | keypair name | `any` | n/a | yes |
| <a name="input_os"></a> [os](#input\_os) | operating system | `any` | n/a | yes |

## Outputs

No outputs.
