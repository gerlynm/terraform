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
| [aws_dynamodb_table.tf-dynamodb](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.tf-bucket](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_versioning.tf-bucket-versioning](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the S3 bucket to be created. | `any` | n/a | yes |
| <a name="input_dynamodb_table"></a> [dynamodb\_table](#input\_dynamodb\_table) | specify the dynamodb table name | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where resources will be created. Default is us-east-1. | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to be applied to AWS resources. Default tags are provided for 'Name' and 'Environment'. | `map` | <pre>{<br>  "Environment": "dev",<br>  "Name": "tf"<br>}</pre> | no |

## Outputs

No outputs.
