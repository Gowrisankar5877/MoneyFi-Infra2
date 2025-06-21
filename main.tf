provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.105.0"
    }
  }
  required_version = ">= 1.3.0"
}

# -------------------------
# Resource Group
# -------------------------
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# -------------------------
# VNet 1 - Central India
# -------------------------
resource "azurerm_virtual_network" "vnet_central" {
  name                = "MoneyFi-Vnet1"
  address_space       = ["10.10.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "subnet1_central" {
  name                 = "MoneyFi-V1S1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vnet_central.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "subnet2_central" {
  name                 = "MoneyFi-V1S2"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vnet_central.name
  address_prefixes     = ["10.10.2.0/24"]
}

# -------------------------
# VNet 2 - West India
# -------------------------
resource "azurerm_virtual_network" "vnet_west" {
  name                = "MoneyFi-Vnet2"
  address_space       = ["10.20.0.0/16"]
  location            = var.secondary_location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "subnet1_west" {
  name                 = "MoneyFi-V2S1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vnet_west.name
  address_prefixes     = ["10.20.1.0/24"]
}

resource "azurerm_subnet" "subnet2_west" {
  name                 = "MoneyFi-V2S2"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vnet_west.name
  address_prefixes     = ["10.20.2.0/24"]
}

# -------------------------
# NSG - Central India
# -------------------------
resource "azurerm_network_security_group" "nsg_private_central" {
  name                = "Moneyfinsg-private-central"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "DenyInternetInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowVNetInbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
    source_port_range          = "*"
    destination_port_range     = "*"
  }

  security_rule {
    name                       = "AllowAllOutbound"
    priority                   = 300
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
  }
}

# -------------------------
# NSG - japan west
# -------------------------
resource "azurerm_network_security_group" "nsg_private_west" {
  name                = "Moneyfinsg-private-japanwest"
  location            = var.secondary_location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "DenyInternetInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowVNetInbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
    source_port_range          = "*"
    destination_port_range     = "*"
  }

  security_rule {
    name                       = "AllowAllOutbound"
    priority                   = 300
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
  }
}

# -------------------------
# NSG Associations - Central India
# -------------------------
resource "azurerm_subnet_network_security_group_association" "assoc_subnet1_central" {
  subnet_id                 = azurerm_subnet.subnet1_central.id
  network_security_group_id = azurerm_network_security_group.nsg_private_central.id
}

resource "azurerm_subnet_network_security_group_association" "assoc_subnet2_central" {
  subnet_id                 = azurerm_subnet.subnet2_central.id
  network_security_group_id = azurerm_network_security_group.nsg_private_central.id
}

# -------------------------
# NSG Associations - West India
# -------------------------
resource "azurerm_subnet_network_security_group_association" "assoc_subnet1_west" {
  subnet_id                 = azurerm_subnet.subnet1_west.id
  network_security_group_id = azurerm_network_security_group.nsg_private_west.id
}

resource "azurerm_subnet_network_security_group_association" "assoc_subnet2_west" {
  subnet_id                 = azurerm_subnet.subnet2_west.id
  network_security_group_id = azurerm_network_security_group.nsg_private_west.id
}
