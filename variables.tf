variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "MoneyFi-RG"
}

variable "location" {
  description = "The Azure region where the resource group will be created"
  type        = string
  default     = "canadacentral"
}


variable "secondary_location" {
  description = "The second region for the second VNet"
  type        = string
  default     = "australiasoutheast"
}

variable "sql_server_name" {
  description = "Name of the Azure SQL Server"
  type        = string
  default     = "moneyfisqlserver"
}

variable "sql_admin_username" {
  description = "SQL admin username"
  type        = string
  default     = "gowri"
}

variable "sql_admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}

variable "sql_database_name" {
  description = "Name of the Azure SQL Database"
  type        = string
  default     = "moneyfi_db"
}

