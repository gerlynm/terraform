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
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/eip) | resource |
| [aws_internet_gateway.common_igw](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_subnet_route](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route) | resource |
| [aws_route.public_internet_route](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnet1_association](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_subnet2_association](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet1_association](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet2_association](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet1](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet2](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet1](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet2](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/subnet) | resource |
| [aws_vpc.common_vpc](https://registry.terraform.io/providers/hashicorp/aws/5.19.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | cidr value | `any` | n/a | yes |
| <a name="input_igw-name"></a> [igw-name](#input\_igw-name) | internet gateway name | `any` | n/a | yes |
| <a name="input_pub-subnet1-az"></a> [pub-subnet1-az](#input\_pub-subnet1-az) | public subnet1 availability zone | `any` | n/a | yes |
| <a name="input_pub-subnet1-cidr"></a> [pub-subnet1-cidr](#input\_pub-subnet1-cidr) | public subnet1 cidr value | `any` | n/a | yes |
| <a name="input_pub-subnet2-az"></a> [pub-subnet2-az](#input\_pub-subnet2-az) | public subnet2 availability zone | `any` | n/a | yes |
| <a name="input_pub-subnet2-cidr"></a> [pub-subnet2-cidr](#input\_pub-subnet2-cidr) | public subnet2 cidr value | `any` | n/a | yes |
| <a name="input_pubrt-name"></a> [pubrt-name](#input\_pubrt-name) | public routetable name | `any` | n/a | yes |
| <a name="input_pubsubnet1-name"></a> [pubsubnet1-name](#input\_pubsubnet1-name) | public subnet1 name | `any` | n/a | yes |
| <a name="input_pubsubnet2-name"></a> [pubsubnet2-name](#input\_pubsubnet2-name) | public subnet2 name | `any` | n/a | yes |
| <a name="input_pvt-subnet1-az"></a> [pvt-subnet1-az](#input\_pvt-subnet1-az) | private subnet1 availability zone | `any` | n/a | yes |
| <a name="input_pvt-subnet1-cidr"></a> [pvt-subnet1-cidr](#input\_pvt-subnet1-cidr) | private subnet1 cidr value | `any` | n/a | yes |
| <a name="input_pvt-subnet2-az"></a> [pvt-subnet2-az](#input\_pvt-subnet2-az) | private subnet2 availability zone | `any` | n/a | yes |
| <a name="input_pvt-subnet2-cidr"></a> [pvt-subnet2-cidr](#input\_pvt-subnet2-cidr) | private subnet2 cidr value | `any` | n/a | yes |
| <a name="input_pvtrt-name"></a> [pvtrt-name](#input\_pvtrt-name) | private routetable name | `any` | n/a | yes |
| <a name="input_pvtsubnet1-name"></a> [pvtsubnet1-name](#input\_pvtsubnet1-name) | private subnet1 name | `any` | n/a | yes |
| <a name="input_pvtsubnet2-name"></a> [pvtsubnet2-name](#input\_pvtsubnet2-name) | private subnet2 name | `any` | n/a | yes |
| <a name="input_vpc-name"></a> [vpc-name](#input\_vpc-name) | vpc name | `any` | n/a | yes |

## Outputs

No outputs.
