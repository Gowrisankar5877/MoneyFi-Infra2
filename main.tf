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
  location = "australiaeast"
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


# ------------------------------------
# AKS Cluster - Central India
# ------------------------------------
resource "azurerm_kubernetes_cluster" "aks_central" {
  name                = "MoneyFi-AKS1"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "akscentral"

  default_node_pool {
    name           = "np1"
    node_count     = 2
    vm_size        = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.subnet1_central.id
  }

  identity {
    type = "SystemAssigned"
  }

  private_cluster_enabled = true

  network_profile {
    network_plugin      = "azure"
    network_policy      = "azure"
    dns_service_ip      = "10.2.0.10"
    service_cidr        = "10.2.0.0/24"
    docker_bridge_cidr  = "172.17.0.1/16"
  }

  depends_on = [
    azurerm_subnet_network_security_group_association.assoc_subnet1_central
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "central_np2" {
  name                  = "np2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_central.id
  vm_size               = "Standard_B2s"
  node_count            = 2
  vnet_subnet_id        = azurerm_subnet.subnet2_central.id
  mode                  = "User"
  orchestrator_version  = azurerm_kubernetes_cluster.aks_central.kubernetes_version

  depends_on = [
    azurerm_subnet_network_security_group_association.assoc_subnet2_central
  ]
}

# ------------------------------------
# AKS Cluster - West India
# ------------------------------------
resource "azurerm_kubernetes_cluster" "aks_west" {
  name                = "MoneyFi-aks2"
  location            = var.secondary_location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "akswest"

  default_node_pool {
    name           = "np1"
    node_count     = 2
    vm_size        = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.subnet1_west.id
  }

  identity {
    type = "SystemAssigned"
  }

  private_cluster_enabled = true

  network_profile {
    network_plugin      = "azure"
    network_policy      = "azure"
    dns_service_ip      = "10.3.0.10"
    service_cidr        = "10.3.0.0/24"
    docker_bridge_cidr  = "172.17.0.1/16"
  }

  depends_on = [
    azurerm_subnet_network_security_group_association.assoc_subnet1_west
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "west_np2" {
  name                  = "np2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_west.id
  vm_size               = "Standard_B2s"
  node_count            = 2
  vnet_subnet_id        = azurerm_subnet.subnet2_west.id
  mode                  = "User"
  orchestrator_version  = azurerm_kubernetes_cluster.aks_west.kubernetes_version

  depends_on = [
    azurerm_subnet_network_security_group_association.assoc_subnet2_west
  ]
}

#-----------------------------------
# ACR CREATION 
#-----------------------------------

resource "azurerm_container_registry" "acr" {
  name                = "moneyfiacr"  
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
  admin_enabled       = true

}



# -------------------------
# Azure SQL Server & DB
# -------------------------

resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  public_network_access_enabled = false
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "db" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.sql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  sku_name       = "Basic"
  max_size_gb    = 2
}

# -------------------------
# Small VNet in Australia East for Private Endpoint
# -------------------------
resource "azurerm_virtual_network" "pe_vnet" {
  name                = "moneyfi-pe-vnet"
  address_space       = ["10.100.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "pe_subnet" {
  name                 = "moneyfi-pe-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.pe_vnet.name
  address_prefixes     = ["10.100.1.0/24"]
}

# -------------------------
# Private DNS Zone
# -------------------------
resource "azurerm_private_dns_zone" "sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

# -------------------------
# Private Endpoint
# -------------------------
resource "azurerm_private_endpoint" "sql_pe" {
  name                = "moneyfi-sql-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.pe_subnet.id

  private_service_connection {
    name                           = "moneyfi-sql-pe-conn"
    private_connection_resource_id = azurerm_mssql_server.sql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection = false
  }

  private_dns_zone_group {
    name                 = "sql-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.sql.id]
  }
}

# -------------------------
# DNS Zone Linking to All VNets
# -------------------------
resource "azurerm_private_dns_zone_virtual_network_link" "link_central" {
  name                  = "sql-dns-link-central"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = azurerm_virtual_network.vnet_central.id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "link_west" {
  name                  = "sql-dns-link-west"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = azurerm_virtual_network.vnet_west.id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "link_pe" {
  name                  = "sql-dns-link-pe"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = azurerm_virtual_network.pe_vnet.id
  registration_enabled  = false
}

# -------------------------
# VNet Peering (Central + West → PE VNet)
# -------------------------
resource "azurerm_virtual_network_peering" "central_to_pe" {
  name                      = "central-to-pe"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_central.name
  remote_virtual_network_id = azurerm_virtual_network.pe_vnet.id
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "pe_to_central" {
  name                      = "pe-to-central"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.pe_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_central.id
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "west_to_pe" {
  name                      = "west-to-pe"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_west.name
  remote_virtual_network_id = azurerm_virtual_network.pe_vnet.id
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "pe_to_west" {
  name                      = "pe-to-west"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.pe_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_west.id
  allow_forwarded_traffic   = true
}





