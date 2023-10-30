## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | 1.24.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | 1.24.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_capv_permissions"></a> [capv\_permissions](#module\_capv\_permissions) | ./permissions | n/a |

## Resources

| Name | Type |
|------|------|
| [vsphere_role.capv_datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/resources/role) | resource |
| [vsphere_role.capv_k8scluster](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/resources/role) | resource |
| [vsphere_role.capv_k8smanagement](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/resources/role) | resource |
| [vsphere_role.capv_readonly](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/resources/role) | resource |
| [vsphere_role.capv_vcenter](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_name_datacenter"></a> [role\_name\_datacenter](#input\_role\_name\_datacenter) | Name of the role for datacenter, cluster and host permissions. Required for all clusters. | `string` | `"capv-datacenter"` | no |
| <a name="input_role_name_k8scluster"></a> [role\_name\_k8scluster](#input\_role\_name\_k8scluster) | Name of the role for managed k8s cluster permissions. Optional for attached clusters only. | `string` | `"capv-k8scluster"` | no |
| <a name="input_role_name_k8smanagement"></a> [role\_name\_k8smanagement](#input\_role\_name\_k8smanagement) | Name of the role for k8s management permissions. Required for management clusters. | `string` | `"capv-k8smanagement"` | no |
| <a name="input_role_name_prefix"></a> [role\_name\_prefix](#input\_role\_name\_prefix) | Prefix for role name | `string` | `"dkp-"` | no |
| <a name="input_role_name_printf"></a> [role\_name\_printf](#input\_role\_name\_printf) | printf format for role name. Inputs (in order): prefix, role name, suffix | `string` | `"%[1]s%[2]s%[3]s"` | no |
| <a name="input_role_name_readonly"></a> [role\_name\_readonly](#input\_role\_name\_readonly) | Name of the role for read-only permissions. Optional if templates are stored outside of folder and/or datastore of the capv-k8smanagement role. | `string` | `"capv-readonly"` | no |
| <a name="input_role_name_suffix"></a> [role\_name\_suffix](#input\_role\_name\_suffix) | Suffix for role name | `string` | `""` | no |
| <a name="input_role_name_vcenter"></a> [role\_name\_vcenter](#input\_role\_name\_vcenter) | Name of the role for vCenter permissions. Required for all clusters | `string` | `"capv-vcenter"` | no |

## Outputs

No outputs.
