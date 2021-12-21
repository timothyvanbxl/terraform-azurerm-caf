resource "azurerm_data_factory_linked_service_odata" "linked_service_odata" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  data_factory_name        = var.data_factory_name
  url                      = var.url
  description              = try(var.description, null)
  integration_runtime_name = try(var.integration_runtime_name, null)
  annotations              = try(var.annotations, null)
  parameters               = try(var.parameters, null)
  additional_properties    = try(var.additional_properties, null)

  dynamic "basic_authentication" {
    for_each = try(var.basic_authentication, null) == null ? [] : [1]

    content {
      username = var.basic_authentication.username
      password = var.basic_authentication.password 
    }
  }
}