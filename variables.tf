variable "resource_group_name" {
  type        = string
  default     = "MoneyFi-RG"
}

variable "location" {
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  type        = string
  default     = "MoneyFitfstate"  
}

variable "container_name" {
  type        = string
  default     = "tfstate"
}
