variable "public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
}

variable "private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
}

variable "org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
}

variable "project_name" {
  description = "Name of the MongoDB project"
  type        = string
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "jenkins-demo-cluster"
}

variable "region" {
  description = "Cloud provider region"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "access_cidr" {
  description = "CIDR block for access (e.g., 0.0.0.0/0)"
  type        = string
}
