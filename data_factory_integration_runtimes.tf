##### azurerm_data_factory_integration_runtime_azure
module "data_factory_integration_runtime_azure" {
  source = "./modules/data_factory/integration_runtimes/integration_runtime"

  for_each = local.data_factory.integration_runtimes.integration_runtime

  name                    = each.value.name
  #data_factory_id         = module.data_factory[each.value.data_factory_key].id
  data_factory_name       = module.data_factory[each.value.data_factory_key].name
  resource_group_name     = local.resource_groups[each.value.resource_group_key].name
  location                = try(each.value.location, local.resource_groups[each.value.resource_group_key].location, local.global_settings.regions[each.value.region])
  description             = try(each.value.description, null)
  #cleanup_enabled         = try(each.value.cleanup_enabled, null)
  compute_type            = try(each.value.compute_type, null)
  core_count              = try(each.value.core_count, null)
  time_to_live_min        = try(each.value.time_to_live_min, null)
  virtual_network_enabled = try(each.value.virtual_network_enabled, null)
}

##### azurerm_data_factory_integration_runtime_self_hosted
module "data_factory_integration_runtime_self_hosted" {
  source = "./modules/data_factory/integration_runtimes/self_hosted"

  for_each = local.data_factory.integration_runtimes.self_hosted

  name                    = each.value.name
  #data_factory_id         = module.data_factory[each.value.data_factory_key].id
  data_factory_name       = module.data_factory[each.value.data_factory_key].name
  resource_group_name     = local.resource_groups[each.value.resource_group_key].name
  description             = try(each.value.description, null)
  rbac_authorization      = try(each.value.rbac_authorization, null)
}

