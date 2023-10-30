terraform {
    required_providers {
        vsphere = {
        source  = "hashicorp/vsphere"
        version = "1.24.3"
        }
    }
}

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

module "capv_permissions" {
    source = "./permissions"

    role_name_prefix = var.role_name_prefix
    role_name_suffix = var.role_name_suffix
    role_name_datacenter = var.role_name_datacenter
    role_name_k8scluster = var.role_name_k8scluster
    role_name_k8smanagement = var.role_name_k8smanagement
    role_name_readonly = var.role_name_readonly
    role_name_vcenter = var.role_name_vcenter
    role_name_printf = var.role_name_printf
}

resource "vsphere_role" "capv_datacenter" {
    name = module.capv_permissions.name_capv_datacenter
    role_privileges = module.capv_permissions.object_capv_datacenter
}

resource "vsphere_role" "capv_k8scluster" {
    name = module.capv_permissions.name_capv_k8scluster
    role_privileges = module.capv_permissions.object_capv_k8scluster
}

resource "vsphere_role" "capv_k8smanagement" {
    name = module.capv_permissions.name_capv_k8smanagement
    role_privileges = module.capv_permissions.object_capv_k8smanagement
}

resource "vsphere_role" "capv_readonly" {
    name = module.capv_permissions.name_capv_readonly
    role_privileges = module.capv_permissions.object_capv_readonly
}

resource "vsphere_role" "capv_vcenter" {
    name = module.capv_permissions.name_capv_vcenter
    role_privileges = module.capv_permissions.object_capv_vcenter
}
