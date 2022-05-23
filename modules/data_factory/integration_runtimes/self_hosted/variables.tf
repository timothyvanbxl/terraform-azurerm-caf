variable "name" {
  description = "(Required) Specifies the name of the Managed Integration Runtime. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions."
}

variable "data_factory_name" {
  description = "(Required) The Data Factory name in which to associate the Linked Service with. Changing this forces a new resource."
}

variable "resource_group_name" {
  description = ""
}

variable "description" {
  description = "(Optional) Integration runtime description."
}

variable "rbac_authorization" {
  description = "(Optional) A rbac_authorization block as defined below."
}
