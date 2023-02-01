# sf-b5
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.4.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | = 0.84 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_test"></a> [lb\_test](#module\_lb\_test) | ./modules/balancer | n/a |
| <a name="module_ya_instance_1"></a> [ya\_instance\_1](#module\_ya\_instance\_1) | ./modules/instance | n/a |
| <a name="module_ya_instance_2"></a> [ya\_instance\_2](#module\_ya\_instance\_2) | ./modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_iam_service_account.sa](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account_static_access_key.sa-static-key](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/iam_service_account_static_access_key) | resource |
| [yandex_resourcemanager_folder_iam_member.sa-editor](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_storage_bucket.state](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/storage_bucket) | resource |
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/0.84/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_yandex_folder_id"></a> [yandex\_folder\_id](#input\_yandex\_folder\_id) | n/a | `string` | `"b1gtv6t2104oglbvpco8"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | n/a |
| <a name="output_external_ip_address_vm_1"></a> [external\_ip\_address\_vm\_1](#output\_external\_ip\_address\_vm\_1) | n/a |
| <a name="output_external_ip_address_vm_2"></a> [external\_ip\_address\_vm\_2](#output\_external\_ip\_address\_vm\_2) | n/a |
| <a name="output_internal_ip_address_vm_1"></a> [internal\_ip\_address\_vm\_1](#output\_internal\_ip\_address\_vm\_1) | n/a |
| <a name="output_internal_ip_address_vm_2"></a> [internal\_ip\_address\_vm\_2](#output\_internal\_ip\_address\_vm\_2) | n/a |
| <a name="output_secret_key"></a> [secret\_key](#output\_secret\_key) | n/a |
<!-- END_TF_DOCS -->