variable "location" {
  description = "Azure region for the AKS resource group and cluster."
  type        = string
  default     = "swedencentral"
}

variable "env_name" {
  description = "Short name of the environment."
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

locals {
  resource_basename = "${var.project_name}-${var.env_name}"
  platform_admins = toset([
    # Whoever is running (pipeline?). Will flap, though.
    data.azurerm_client_config.current.object_id,
    # Your personal user ID: az ad signed-in-user show --query id -o tsv
    "1263d89e-4b6d-44cf-9149-75c19a3412e5",
  ])
}

data "azurerm_client_config" "current" {}
