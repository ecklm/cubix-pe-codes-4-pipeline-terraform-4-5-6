terraform {
  required_version = ">= 1.4"

  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    storage_account_name = "platencbecklm"
    container_name       = "tfstate"
    key                  = "project-x-sbx.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "fba39c62-2b48-482e-8377-d811aa355544"
  tenant_id       = "8820d9af-b533-4848-9bf3-ebf24d29d140"
}
