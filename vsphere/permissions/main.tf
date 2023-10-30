terraform {}

variable "role_name_prefix" {
    description = "Prefix for role name"
    type = string
    default = "dkp-"
}

variable "role_name_suffix" {
    description = "Suffix for role name"
    type = string
    default = ""
}

variable "role_name_datacenter" {
    description = "Name of the role for datacenter, cluster and host permissions. Required for all clusters."
    type = string
    default = "capv-datacenter"
}

variable "role_name_k8scluster" {
    description = "Name of the role for managed k8s cluster permissions. Optional for attached clusters only."
    type = string
    default = "capv-k8scluster"
}

variable "role_name_k8smanagement" {
    description = "Name of the role for k8s management permissions. Required for management clusters."
    type = string
    default = "capv-k8smanagement"
}

variable "role_name_readonly" {
    description = "Name of the role for read-only permissions. Optional if templates are stored outside of folder and/or datastore of the capv-k8smanagement role."
    type = string
    default = "capv-readonly"
}

variable "role_name_vcenter" {
    description = "Name of the role for vCenter permissions. Required for all clusters"
    type = string
    default = "capv-vcenter"
}

variable "role_name_printf" {
    description = "printf format for role name. Inputs (in order): prefix, role name, suffix"
    type = string
    default = "%[1]s%[2]s%[3]s"
}

locals {
    tmpl_capv_datacenter = templatefile("${path.module}/templates/dkp-capv-datacenter.tmpl", {})
    tmpl_capv_k8scluster = templatefile("${path.module}/templates/dkp-capv-k8scluster.tmpl", {})
    tmpl_capv_k8smanagement = templatefile("${path.module}/templates/dkp-capv-k8smanagement.tmpl", {})
    tmpl_capv_readonly = templatefile("${path.module}/templates/dkp-capv-readonly.tmpl", {})
    tmpl_capv_vcenter = templatefile("${path.module}/templates/dkp-capv-vcenter.tmpl", {})

    role_name_capv_datacenter = format(var.role_name_printf, var.role_name_prefix, var.role_name_datacenter, var.role_name_suffix)
    role_name_capv_k8scluster = format(var.role_name_printf, var.role_name_prefix, var.role_name_k8scluster, var.role_name_suffix)
    role_name_capv_k8smanagement = format(var.role_name_printf, var.role_name_prefix, var.role_name_k8smanagement, var.role_name_suffix)
    role_name_capv_readonly = format(var.role_name_printf, var.role_name_prefix, var.role_name_readonly, var.role_name_suffix)
    role_name_capv_vcenter = format(var.role_name_printf, var.role_name_prefix, var.role_name_vcenter, var.role_name_suffix)

    cli_templatefilename = "${path.module}/templates/bash-create-role.sh.tmpl"

    list_capv_datacenter = compact([for i in split("\n", local.tmpl_capv_datacenter) : trimspace(i)])
    json_capv_datacenter = jsonencode(local.list_capv_datacenter)
    cli_capv_datacenter = templatefile(local.cli_templatefilename, {
        role_name = local.role_name_capv_datacenter,
        role_privileges = local.list_capv_datacenter
    })

    list_capv_k8scluster = compact([for i in split("\n", local.tmpl_capv_k8scluster) : trimspace(i)])
    json_capv_k8scluster = jsonencode(local.list_capv_k8scluster)
    cli_capv_k8scluster = templatefile(local.cli_templatefilename, {
        role_name = local.role_name_capv_k8scluster,
        role_privileges = local.list_capv_k8scluster
    })

    list_capv_k8smanagement = compact([for i in split("\n", local.tmpl_capv_k8smanagement) : trimspace(i)])
    json_capv_k8smanagement = jsonencode(local.list_capv_k8smanagement)
    cli_capv_k8smanagement = templatefile(local.cli_templatefilename, {
        role_name = local.role_name_capv_k8smanagement,
        role_privileges = local.list_capv_k8smanagement
    })

    list_capv_readonly = compact([for i in split("\n", local.tmpl_capv_readonly) : trimspace(i)])
    json_capv_readonly = jsonencode(local.list_capv_readonly)
    cli_capv_readonly = templatefile(local.cli_templatefilename, {
        role_name = local.role_name_capv_readonly,
        role_privileges = local.list_capv_readonly
    })

    list_capv_vcenter = compact([for i in split("\n", local.tmpl_capv_vcenter) : trimspace(i)])
    json_capv_vcenter = jsonencode(local.list_capv_vcenter)
    cli_capv_vcenter = templatefile(local.cli_templatefilename, {
        role_name = local.role_name_capv_vcenter,
        role_privileges = local.list_capv_vcenter
    })
}


output "json_capv_datacenter" {
    description = "JSON representation of the capv-datacenter role privileges"
    value = local.json_capv_datacenter
}

output "object_capv_datacenter" {
    description = "Object representation of the capv-datacenter role privileges"
    value = local.list_capv_datacenter
}

output "bash_capv_datacenter" {
    description = "Bash script to create the capv-datacenter role"
    value = local.cli_capv_datacenter
}

output "name_capv_datacenter" {
    description = "Name of the capv-datacenter role"
    value = local.role_name_capv_datacenter
  
}


output "json_capv_k8scluster" {
    description = "JSON representation of the capv-k8scluster role privileges"
    value = local.json_capv_k8scluster
}

output "object_capv_k8scluster" {
    description = "Object representation of the capv-k8scluster role privileges"
    value = local.list_capv_k8scluster
}

output "bash_capv_k8scluster" {
    description = "Bash script to create the capv-k8scluster role"
    value = local.cli_capv_k8scluster
}

output "name_capv_k8scluster" {
    description = "Name of the capv-k8scluster role"
    value = local.role_name_capv_k8scluster
}


output "json_capv_k8smanagement" {
    description = "JSON representation of the capv-k8smanagement role privileges"
    value = local.json_capv_k8smanagement
}

output "object_capv_k8smanagement" {
    description = "Object representation of the capv-k8smanagement role privileges"
    value = local.list_capv_k8smanagement
}

output "bash_capv_k8smanagement" {
    description = "Bash script to create the capv-k8smanagement role"
    value = local.cli_capv_k8smanagement
}

output "name_capv_k8smanagement" {
    description = "Name of the capv-k8smanagement role"
    value = local.role_name_capv_k8smanagement
}



output "json_capv_readonly" {
    description = "JSON representation of the capv-readonly role privileges"
    value = local.json_capv_readonly
}

output "object_capv_readonly" {
    description = "Object representation of the capv-readonly role privileges"
    value = local.list_capv_readonly
}

output "bash_capv_readonly" {
    description = "Bash script to create the capv-readonly role"
    value = local.cli_capv_readonly
}

output "name_capv_readonly" {
    description = "Name of the capv-readonly role"
    value = local.role_name_capv_readonly
}



output "json_capv_vcenter" {
    description = "JSON representation of the capv-vcenter role privileges"
    value = local.json_capv_vcenter
}   

output "object_capv_vcenter" {
    description = "Object representation of the capv-vcenter role privileges"
    value = local.list_capv_vcenter
}

output "bash_capv_vcenter" {
    description = "Bash script to create the capv-vcenter role"
    value = local.cli_capv_vcenter
}

output "name_capv_vcenter" {
    description = "Name of the capv-vcenter role"
    value = local.role_name_capv_vcenter
}
