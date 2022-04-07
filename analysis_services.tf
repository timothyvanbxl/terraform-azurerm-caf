module "analysis_services" {
  source   = "./modules/databases/analysis_service"
  for_each = local.database.analysis_services

  name                = each.value.name
  location            = lookup(each.value, "region", null) == null ? local.resource_groups[each.value.resource_group_key].location : local.global_settings.regions[each.value.region]
  resource_group_name = local.resource_groups[each.value.resource_group_key].name
  global_settings     = local.global_settings
  settings            = each.value
  base_tags           = try(local.global_settings.inherit_tags, false) ? local.resource_groups[each.value.resource_group_key].tags : {}
}

output "analysis_services" {
  value = module.analysis_services
}