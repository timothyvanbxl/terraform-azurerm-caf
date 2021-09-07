resource "azurerm_data_factory_managed_private_endpoint" "managed_private_endpoint_data_lake_storage_gen2" {
  name               = var.name
  data_factory_id    = var.data_factory_id
  target_resource_id = var.target_resource_id
  subresource_name   = "dfs"
}