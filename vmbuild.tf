provider "azurerm" {
  # using alias for multiple provider blocks within the same terraform group
  features {}
  alias           = "prodsubcription"
  subscription_id = "000beb2d-5aa1-4474-8513-24763096f9f9"
  client_id       = "2fa8faf9-44c5-4f91-9302-b8ad9475c8e3"
  client_secret   = "PpiA0.QL-LfzV8cChjSJTdS.w6PTTS~4Mz"
  tenant_id       = "3cb35a01-000a-4736-ad3b-440306485905"
#add comments
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<=2.97.0" #locking azurerm version
    }
  }
  required_version = ">=1.1.0" #locking terraform version
}
resource "azurerm_resource_group" "example" {
  provider = azurerm.prodsubcription
  name     = "rg-nsg"
  location = "westus"
}
resource "azurerm_network_security_group" "example" {
  provider            = azurerm.prodsubcription
  name                = "my-nsg"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  dynamic "security_rule" {
    for_each = var.nsg_rules # loop
    content {
      access                     = security_rule.value["access"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
      destination_port_range     = security_rule.value["destination_port_range"]
      direction                  = security_rule.value["direction"]
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      protocol                   = security_rule.value["protocol"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      source_port_range          = security_rule.value["source_port_range"]
    }
  }
}

#priority for debugging

#command line variables -- var =
#command line file reference = --var-file ="*.tfvars"
#*.auto.tfvars
#terraform.tvars
#environment variable
#default valie in variable definition
# to do import and make sure you have the id here is the scritpt:
# terraform import azurerm_resource_group.example1 /subscriptions/000beb2d-5aa1-4474-8513-24763096f9f9/resourceGroups/rg_import
resource "azurerm_resource_group" "example1" {
  provider = azurerm.prodsubcription
  name     = "rg_import"
  location = "westus"
  #test
}
