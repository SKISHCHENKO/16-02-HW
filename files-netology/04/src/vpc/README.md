## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.201.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.201.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.this](https://registry.terraform.io/providers/yandex-cloud/yandex/0.201.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.this](https://registry.terraform.io/providers/yandex-cloud/yandex/0.201.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment name | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | VPC network name | `string` | n/a | yes |
| <a name="input_v4_cidr_blocks"></a> [v4\_cidr\_blocks](#input\_v4\_cidr\_blocks) | IPv4 CIDR blocks for subnet | `list(string)` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Yandex Cloud zone for subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | VPC network ID |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | VPC network name |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Full information about created subnet |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | Subnet ID |
| <a name="output_subnet_v4_cidr_blocks"></a> [subnet\_v4\_cidr\_blocks](#output\_subnet\_v4\_cidr\_blocks) | Subnet IPv4 CIDR blocks |
| <a name="output_subnet_zone"></a> [subnet\_zone](#output\_subnet\_zone) | Subnet zone |
