variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "vm_admin_user" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}


variable "vm_size" {
  description = "Size for Azure VM"
  type        = string
  default     = "Standard_B1s"
}