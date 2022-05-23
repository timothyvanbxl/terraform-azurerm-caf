resource "azurerm_data_factory_integration_runtime_self_hosted" "shir" {
  name                    = var.name
  data_factory_name       = var.data_factory_name
  resource_group_name     = var.resource_group_name
  description             = try(var.description, null)
  #rbac_authorization      = try(var.rbac_authorization, null)

}