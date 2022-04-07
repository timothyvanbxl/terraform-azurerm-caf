resource "azurerm_analysis_services_server" "aas" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  sku                       = lookup(var.settings, "sku", "D1")
  enable_power_bi_service   = lookup(var.settings, "enable_power_bi_service", null)
  tags                      = try(local.tags, null)
  backup_blob_container_uri = lookup(var.settings, "backup_blob_container_uri", null)
  admin_users               = lookup(var.settings, "admin_users", [])
  querypool_connection_mode = lookup(var.settings, "querypool_connection_mode", "All")

  dynamic "ipv4_firewall_rule" {
    for_each = try(var.settings.ipv4_firewall_rules, {})

    content {
      name        = var.settings.ipv4_firewall_rules.firewall_rule.name
      range_start = var.settings.ipv4_firewall_rules.firewall_rule.range_start_ip
      range_end   = var.settings.ipv4_firewall_rules.firewall_rule.range_end_ip
    }
  }
}