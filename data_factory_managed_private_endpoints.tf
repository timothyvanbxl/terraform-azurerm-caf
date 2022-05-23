##### azurerm_data_factory
module "managed_private_endpoint_data_lake_storage_gen2" {
  source = "./modules/data_factory/managed_private_endpoints/data_lake_storage_gen2"

  for_each = local.data_factory.managed_private_endpoints.data_lake_storage_gen2

  name               = each.value.name
  data_factory_id    = module.data_factory[each.value.data_factory_key].id
  target_resource_id = module.storage_accounts[each.value.adls_storage_account_key].id
}

module "managed_private_endpoint_keyvault" {
  source = "./modules/data_factory/managed_private_endpoints/keyvault"

  for_each = local.data_factory.managed_private_endpoints.keyvault

  name               = each.value.name
  data_factory_id    = module.data_factory[each.value.data_factory_key].id
  target_resource_id = module.keyvaults[each.value.keyvault_key].id
}

module "managed_private_endpoint_synapse_sql_pool" {
  source = "./modules/data_factory/managed_private_endpoints/synapse_sql_pool"

  for_each = local.data_factory.managed_private_endpoints.synapse_sql_pool

  name               = each.value.name
  data_factory_id    = module.data_factory[each.value.data_factory_key].id
  target_resource_id = each.value.resource_id /*module.synapse_workspaces[each.value.synapse_sql_pools_key].sql_pool.id*/
}
