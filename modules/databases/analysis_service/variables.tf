variable "settings" {
  description = "Configuration object for AAS"
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
}

variable "location" {
  description = "Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where to create the resource."
  type        = string
}

variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}

variable "name" {
  description = "(Required) Name of the AAS"
}