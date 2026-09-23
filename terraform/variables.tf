variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "prefix" {
  description = "Name prefix for all resources (lowercase letters/numbers only, max 10 chars)"
  type        = string
  default     = "houseprice"
}

variable "acr_sku" {
  description = "Container registry SKU: Basic, Standard or Premium"
  type        = string
  default     = "Basic"
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version. null = default supported by Azure"
  type        = string
  default     = null
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "VM size for AKS nodes (change if not available/quota-limited in your region)"
  type        = string
  default     = "Standard_B2s"
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default = {
    project = "house-price-prediction"
    managed = "terraform"
  }
}
