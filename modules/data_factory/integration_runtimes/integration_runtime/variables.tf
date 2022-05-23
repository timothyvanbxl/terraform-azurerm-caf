variable "name" {
  description = "(Required) Specifies the name of the Managed Integration Runtime. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions."
}

variable "data_factory_name" {
  description = "(Required) The Data Factory name in which to associate the Linked Service with. Changing this forces a new resource."
}

variable "resource_group_name" {
  description = ""
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Use AutoResolve to create an auto-resolve integration runtime. Changing this forces a new resource to be created."
}

variable "description" {
  description = "(Optional) Integration runtime description."
}
/*
variable "cleanup_enabled" {
  description = "(Optional) Cluster will not be recycled and it will be used in next data flow activity run until TTL (time to live) is reached if this is set as false. Default is true."
}
*/
variable "compute_type" {
  description = "(Optional) Compute type of the cluster which will execute data flow job. Valid values are General, ComputeOptimized and MemoryOptimized. Defaults to General."
}

variable "core_count" {
  description = "(Optional) Core count of the cluster which will execute data flow job. Valid values are 8, 16, 32, 48, 80, 144 and 272. Defaults to 8."
}

variable "time_to_live_min" {
  description = "(Optional) Time to live (in minutes) setting of the cluster which will execute data flow job. Defaults to 0."
}

variable "virtual_network_enabled" {
  description = "(Optional) Is Integration Runtime compute provisioned within Managed Virtual Network? Changing this forces a new resource to be created."
}
