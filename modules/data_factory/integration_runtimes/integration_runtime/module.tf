resource "azurerm_data_factory_integration_runtime_azure" "ir" {
  name                    = var.name
  data_factory_name       = var.data_factory_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  description             = try(var.description, null)
  #cleanup_enabled         = try(var.cleanup_enabled, null)
  compute_type            = try(var.compute_type, null)
  core_count              = try(var.core_count, null)
  time_to_live_min        = try(var.time_to_live_min, null)
  virtual_network_enabled = try(var.virtual_network_enabled, null)

}