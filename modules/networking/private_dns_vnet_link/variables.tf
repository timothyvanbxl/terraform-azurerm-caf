variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
}
variable "name" {
  description = "Name of the Virtual Network Link"
}

variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "records" {
}

variable "vnet_links" {
  default = {}
}

variable "vnets" {
  default = {}
}

variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}

variable "tags" {
  default = {}
}