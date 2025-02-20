resource "azurecaf_name" "df" {
  name          = var.name
  resource_type = "azurerm_data_factory"
  prefixes      = var.global_settings.prefixes
  suffixes      = var.global_settings.suffixes  
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_data_factory" "df" {
  name                            = azurecaf_name.df.result
  resource_group_name             = var.resource_group_name
  location                        = var.location
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  public_network_enabled          = var.public_network_enabled

  dynamic "github_configuration" {
    for_each = try(var.github_configuration, null) != null ? [var.github_configuration] : []

    content {
      account_name    = github_configuration.value.account_name
      branch_name     = github_configuration.value.branch_name
      git_url         = github_configuration.value.git_url
      repository_name = github_configuration.value.repository_name
      root_folder     = github_configuration.value.root_folder
    }
  }

  dynamic "identity" {
    for_each = try(var.identity, null) != null ? [var.identity] : []

    content {
      type = identity.value.type
    }
  }
  
  dynamic "global_parameter" {
    for_each = try(var.global_parameter, null) != null ? [var.global_parameter] : []

    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }

  /*
  dynamic "global_parameter" {
    for_each = try(var.global_parameter, {})

    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }
  */

  dynamic "vsts_configuration" {
    for_each = try(var.vsts_configuration, null) != null ? [var.vsts_configuration] : []

    content {
      account_name    = vsts_configuration.value.account_name
      branch_name     = vsts_configuration.value.branch_name
      project_name    = vsts_configuration.value.project_name
      repository_name = vsts_configuration.value.repository_name
      root_folder     = vsts_configuration.value.root_folder
      tenant_id       = vsts_configuration.value.tenant_id
    }
  }

  tags = merge(var.tags, var.base_tags)
}
