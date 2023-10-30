## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

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

| Name | Description |
|------|-------------|
| <a name="output_bash_capv_datacenter"></a> [bash\_capv\_datacenter](#output\_bash\_capv\_datacenter) | Bash script to create the capv-datacenter role |
| <a name="output_bash_capv_k8scluster"></a> [bash\_capv\_k8scluster](#output\_bash\_capv\_k8scluster) | Bash script to create the capv-k8scluster role |
| <a name="output_bash_capv_k8smanagement"></a> [bash\_capv\_k8smanagement](#output\_bash\_capv\_k8smanagement) | Bash script to create the capv-k8smanagement role |
| <a name="output_bash_capv_readonly"></a> [bash\_capv\_readonly](#output\_bash\_capv\_readonly) | Bash script to create the capv-readonly role |
| <a name="output_bash_capv_vcenter"></a> [bash\_capv\_vcenter](#output\_bash\_capv\_vcenter) | Bash script to create the capv-vcenter role |
| <a name="output_json_capv_datacenter"></a> [json\_capv\_datacenter](#output\_json\_capv\_datacenter) | JSON representation of the capv-datacenter role privileges |
| <a name="output_json_capv_k8scluster"></a> [json\_capv\_k8scluster](#output\_json\_capv\_k8scluster) | JSON representation of the capv-k8scluster role privileges |
| <a name="output_json_capv_k8smanagement"></a> [json\_capv\_k8smanagement](#output\_json\_capv\_k8smanagement) | JSON representation of the capv-k8smanagement role privileges |
| <a name="output_json_capv_readonly"></a> [json\_capv\_readonly](#output\_json\_capv\_readonly) | JSON representation of the capv-readonly role privileges |
| <a name="output_json_capv_vcenter"></a> [json\_capv\_vcenter](#output\_json\_capv\_vcenter) | JSON representation of the capv-vcenter role privileges |
| <a name="output_name_capv_datacenter"></a> [name\_capv\_datacenter](#output\_name\_capv\_datacenter) | Name of the capv-datacenter role |
| <a name="output_name_capv_k8scluster"></a> [name\_capv\_k8scluster](#output\_name\_capv\_k8scluster) | Name of the capv-k8scluster role |
| <a name="output_name_capv_k8smanagement"></a> [name\_capv\_k8smanagement](#output\_name\_capv\_k8smanagement) | Name of the capv-k8smanagement role |
| <a name="output_name_capv_readonly"></a> [name\_capv\_readonly](#output\_name\_capv\_readonly) | Name of the capv-readonly role |
| <a name="output_name_capv_vcenter"></a> [name\_capv\_vcenter](#output\_name\_capv\_vcenter) | Name of the capv-vcenter role |
| <a name="output_object_capv_datacenter"></a> [object\_capv\_datacenter](#output\_object\_capv\_datacenter) | Object representation of the capv-datacenter role privileges |
| <a name="output_object_capv_k8scluster"></a> [object\_capv\_k8scluster](#output\_object\_capv\_k8scluster) | Object representation of the capv-k8scluster role privileges |
| <a name="output_object_capv_k8smanagement"></a> [object\_capv\_k8smanagement](#output\_object\_capv\_k8smanagement) | Object representation of the capv-k8smanagement role privileges |
| <a name="output_object_capv_readonly"></a> [object\_capv\_readonly](#output\_object\_capv\_readonly) | Object representation of the capv-readonly role privileges |
| <a name="output_object_capv_vcenter"></a> [object\_capv\_vcenter](#output\_object\_capv\_vcenter) | Object representation of the capv-vcenter role privileges |
