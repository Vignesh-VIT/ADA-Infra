module "resource_groups" {
  source   = "../modules/resource_group"
  for_each = local.infrastructure_config.resource_groups
  name     = each.value.name
  location = each.value.location
  tags     = merge(local.common_tags, each.value.tags)
}

module "keyvault" {
  source              = "../modules/keyvault"
  for_each            = local.infrastructure_config.keyvaults
  resource_group_name = module.resource_groups[each.value.resource_group_key].resource_group_name
  name                = each.value.name
  location            = module.resource_groups[each.value.resource_group_key].resource_group_location
  sku                 = each.value.sku
  tags                = local.common_tags
  depends_on          = [module.resource_groups]
}

module "keyvault_access_policy" {
  source       = "../modules/keyvault_access_policy"
  for_each     = local.infrastructure_config.keyvault_access_policies
  key_vault_id = module.keyvault[each.value.keyvault_key].key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id = (
    each.value.type == "access_policy" ? local.access_policy[each.value.name] : null
  )
  secret_permissions = each.value.secret_permissions
  depends_on         = [module.keyvault]
}

module "signalr" {
  source              = "../modules/signalr"
  for_each            = local.infrastructure_config.signalr
  resource_group_name = module.resource_groups[each.value.resource_group_key].resource_group_name
  location            = module.resource_groups[each.value.resource_group_key].resource_group_location
  signalr_name        = each.value.signalr_name
  sku                 = each.value.sku
  capacity            = each.value.capacity
  service_mode        = each.value.service_mode
}

module "servicebus" {
  source                       = "../modules/servicebus"
  for_each                     = local.infrastructure_config.servicebus
  resource_group_name          = module.resource_groups[each.value.resource_group_key].resource_group_name
  location                     = module.resource_groups[each.value.resource_group_key].resource_group_location
  sb_ns_name                   = each.value.sb_ns_name
  sb_ns_sku                    = each.value.sb_ns_sku
  sb_ns_capacity               = each.value.sb_ns_capacity
  premium_messaging_partitions = each.value.premium_messaging_partitions
}

module "servicebus_queues" {
  source        = "../modules/servicebus_queues"
  for_each      = local.infrastructure_config.servicebus_queues
  sb_ns_id      = module.servicebus[each.value.servicebus_key].ns_id
  sb_queue_name = each.value.sb_queue_name
  sb_queue_size = each.value.sb_queue_size
}

module "storage_account" {
  source               = "../modules/storage_account"
  for_each             = local.infrastructure_config.storage_account
  resource_group_name  = module.resource_groups[each.value.resource_group_key].resource_group_name
  location             = module.resource_groups[each.value.resource_group_key].resource_group_location
  storage_account_name = each.value.storage_account_name
  account_tier         = each.value.account_tier
  tags                 = local.common_tags
}

module "storage_account_network_rules" {
  source             = "../modules/storage_network_rules"
  for_each           = local.infrastructure_config.storage_network_rules
  storage_account_id = module.storage_account[each.value.storage_account_key].storage_account_id
  default_action     = each.value.default_action
  bosch_ips          = each.value.bosch_ips
  bypass             = each.value.bypass
  depends_on         = [module.storage_account]
}

module "storage_share" {
  source             = "../modules/storage_share"
  for_each           = local.infrastructure_config.storage_share
  storage_share_name = each.value.storage_share_name
  storage_account_id = module.storage_account[each.value.storage_account_key].storage_account_id
  quota              = each.value.quota
}

# module "cosmos_db" {
#   source                        = "../modules/cosmos_db"
#   for_each                      = local.infrastructure_config.cosmos_db
#   cosmosdb_name                 = each.value.cosmosdb_name
#   resource_group_name           = module.resource_groups[each.value.resource_group_key].resource_group_name
#   location                      = module.resource_groups[each.value.resource_group_key].resource_group_location
#   public_network_access_enabled = each.value.public_network_access_enabled
#   bosch_ips                     = each.value.bosch_ips
#   depends_on                    = [module.resource_groups, module.storage_account]
# }

module "secrets" {
  source   = "../modules/keyvault_secret"
  for_each = local.infrastructure_config.secrets
  name     = each.value.name
  value = (
    each.value.type == "connection_string" ? local.secret_values[each.value.name] :
    each.value.type == "secret" ? local.secret_values[each.value.name] : null
  )
  key_vault_id = module.keyvault[each.value.keyvault_key].key_vault_id
  depends_on   = [module.keyvault, module.storage_account, module.signalr, module.servicebus, module.keyvault_access_policy]
}