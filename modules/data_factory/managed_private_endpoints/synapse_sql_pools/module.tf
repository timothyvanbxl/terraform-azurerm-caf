resource "azurerm_data_factory_managed_private_endpoint" "managed_private_endpoint_synapse_sql_pools" {
  name               = var.name
  data_factory_id    = var.data_factory_id
  target_resource_id = var.target_resource_id
  subresource_name   = "sql"
}