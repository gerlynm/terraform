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
| [aws_instance.jenkins_instance](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/instance) | resource |
| [aws_instance.sonarqube_instance](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/instance) | resource |
| [aws_security_group.jenkins](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/security_group) | resource |
| [aws_security_group.sonarqube](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance-type value | `any` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | key pair name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_jenkins_instance_ip"></a> [jenkins\_instance\_ip](#output\_jenkins\_instance\_ip) | n/a |
| <a name="output_sonarqube_instance_ip"></a> [sonarqube\_instance\_ip](#output\_sonarqube\_instance\_ip) | n/a |
