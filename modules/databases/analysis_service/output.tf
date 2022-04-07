output "id" {
  description = "The ID of the Analysis Services Server."
  value       = azurerm_analysis_services_server.aas.id
}

output "server_full_name" {
  description = "The full name of the Analysis Services Server."
  value       = azurerm_analysis_services_server.aas.server_full_name

}