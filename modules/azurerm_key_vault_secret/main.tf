resource "azurerm_key_vault_secret" "kv" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.kv.id
}