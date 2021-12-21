##### azurerm_data_factory_linked_service_azure_blob_storage
module "data_factory_linked_service_azure_blob_storage" {
  source = "./modules/data_factory/linked_services/azure_blob_storage"

  for_each = local.data_factory.linked_services.azure_blob_storage

  name                     = each.value.name
  resource_group_name      = local.resource_groups[each.value.resource_group_key].name
  data_factory_name        = module.data_factory[each.value.data_factory_key].name
  description              = try(each.value.description, null)
  integration_runtime_name = try(each.value.integration_runtime_name, null)
  annotations              = try(each.value.annotations, null)
  parameters               = try(each.value.parameters, null)
  additional_properties    = try(each.value.additional_properties, null)
  connection_string        = module.storage_accounts[each.value.storage_account_key].primary_connection_string
}

output "data_factory_linked_service_azure_blob_storage" {
  value = module.data_factory_linked_service_azure_blob_storage
}

##### azurerm_data_factory_linked_service_odata
module "data_factory_linked_service_odata" {
  source = "./modules/data_factory/linked_services/odata"

  for_each = local.data_factory.linked_services.odata

  name                     = each.value.name
  resource_group_name      = local.resource_groups[each.value.resource_group_key].name
  data_factory_name        = module.data_factory[each.value.data_factory_key].name
  url                      = each.value.url
  description              = try(each.value.description, null)
  integration_runtime_name = try(each.value.integration_runtime_name, null)
  annotations              = try(each.value.annotations, null)
  parameters               = try(each.value.parameters, null)
  additional_properties    = try(each.value.additional_properties, null)
  basic_authentication     = try(each.value.basic_authentication, null)
}

output "data_factory_linked_service_odata" {
  value = module.data_factory_linked_service_odata
}

##### azurerm_data_factory_linked_service_azure_sql_database
module "data_factory_linked_service_azure_sql_database" {
  source = "./modules/data_factory/linked_services/azure_sql_database"

  for_each = local.data_factory.linked_services.azure_sql_database

  name                     = each.value.name
  resource_group_name      = local.resource_groups[each.value.resource_group_key].name
  data_factory_name        = module.data_factory[each.value.data_factory_key].name
  description              = try(each.value.description, null)
  integration_runtime_name = try(each.value.integration_runtime_name, null)
  annotations              = try(each.value.annotations, null)
  parameters               = try(each.value.parameters, null)
  additional_properties    = try(each.value.additional_properties, null)
  use_managed_identity     = try(each.value.use_managed_identity, false)
  connection_string        = "Server=tcp:${module.mssql_servers[each.value.mssql_server_key].fully_qualified_domain_name},1433;Initial Catalog=${module.mssql_databases[each.value.mssql_database_key].name};Persist Security Info=False;;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

output "data_factory_linked_service_azure_sql_database" {
  value = module.data_factory_linked_service_azure_sql_database
}

##### azurerm_data_factory_linked_service_key_vault
module "data_factory_linked_service_key_vault" {
  source = "./modules/data_factory/linked_services/key_vault"

  for_each = local.data_factory.linked_services.key_vault

  name                     = each.value.name
  resource_group_name      = local.resource_groups[each.value.resource_group_key].name
  data_factory_name        = module.data_factory[each.value.data_factory_key].name
  description              = try(each.value.description, null)
  integration_runtime_name = try(each.value.integration_runtime_name, null)
  annotations              = try(each.value.annotations, null)
  parameters               = try(each.value.parameters, null)
  additional_properties    = try(each.value.additional_properties, null)
  key_vault_id             = module.keyvaults[each.value.key_vault_key].id
}

output "data_factory_linked_service_key_vault" {
  value = module.data_factory_linked_service_key_vault
}