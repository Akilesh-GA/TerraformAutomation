variable "public_key" {
  description = "MongoDB Atlas public API key"
  type        = string
}

variable "private_key" {
  description = "MongoDB Atlas private API key"
  type        = string
}

variable "org_id" {
  description = "MongoDB Atlas organization ID"
  type        = string
}

variable "region" {
  description = "Cloud provider region for the cluster"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "access_cidr" {
  description = "CIDR block for IP whitelist"
  type        = string
}
