variable "name" {
  description = "(Required) Specifies the name which should be used for this Managed Private Endpoint. Changing this forces a new resource to be created."
}

variable "data_factory_id" {
  description = "(Required) The ID of the Data Factory on which to create the Managed Private Endpoint. Changing this forces a new resource to be created."
}

variable "target_resource_id" {
  description = "(Required) The ID of the Private Link Enabled Remote Resource which this Data Factory Private Endpoint should be connected to. Changing this forces a new resource to be created."
}