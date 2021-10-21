module "cluster" {
  source   = "./cluster"
  for_each = try(var.settings.cluster, {})

  global_settings = var.global_settings
  settings        = each.value
  tags            = local.tags
}
