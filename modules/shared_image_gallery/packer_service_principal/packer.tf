data "azurerm_key_vault_secret" "packer_client_id" {
  name         = format("%s-client-id", var.settings.secret_prefix)
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "packer_secret" {
  name         = format("%s-client-secret", var.settings.secret_prefix)
  key_vault_id = var.key_vault_id
}

data "template_file" "packer_template" {
  vars = {
    client_id                         = data.azurerm_key_vault_secret.packer_client_id.value
    client_secret                     = data.azurerm_key_vault_secret.packer_secret.value
    tenant_id                         = var.tenant_id
    subscription_id                   = var.subscription
    os_type                           = var.settings.os_type
    image_publisher                   = var.settings.image_publisher
    image_offer                       = var.settings.image_offer
    image_sku                         = var.settings.image_sku
    location                          = var.location
    vm_size                           = var.settings.vm_size
    managed_image_resource_group_name = var.resource_group_name

    managed_image_name    = var.settings.managed_image_name

    subscription        = var.subscription
    resource_group      = var.resource_group_name
    gallery_name        = var.gallery_name
    image_name          = var.image_name
    image_version       = var.settings.shared_image_gallery_destination.image_version
    replication_regions = var.settings.shared_image_gallery_destination.replication_regions
  }
}
resource "null_resource" "create_image" {
  provisioner "local-exec" {
    command = "packer build -force ${var.settings.packer_config_filepath}"
  }
  depends_on = [
    data.template_file.packer_template
  ]
}

data "azurerm_shared_image_version" "image_version" {
  name                = var.settings.shared_image_gallery_destination.image_version
  gallery_name        = var.gallery_name
  image_name          = var.image_name
  resource_group_name = var.resource_group_name
  depends_on = [
    null_resource.create_image
  ]
}

resource "time_sleep" "time_delay_3" {
  destroy_duration = "60s"
}
