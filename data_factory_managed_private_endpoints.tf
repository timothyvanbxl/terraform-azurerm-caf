##### azurerm_data_factory
module "managed_private_endpoint_data_lake_storage_gen2" {
  source = "./modules/data_factory/managed_private_endpoints/data_lake_storage_gen2"

  for_each = local.data_factory.managed_private_endpoints.data_lake_storage_gen2

  name               = each.value.name
  data_factory_id    = module.data_factory[each.value.data_factory_key].id
  target_resource_id = module.storage_accounts[each.value.adls_storage_account_key].id
}
/*
output "data_factory_dataset_azure_blob" {
  value = module.data_factory_dataset_azure_blob
}
*/
