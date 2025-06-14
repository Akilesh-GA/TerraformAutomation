terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.10.0"
    }
  }

  required_version = ">= 1.0"
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

resource "mongodbatlas_project" "project" {
  name   = var.project_name
  org_id = var.org_id
}

resource "mongodbatlas_cluster" "cluster" {
  project_id   = mongodbatlas_project.project.id
  name         = "${var.project_name}-cluster"
  cluster_type = "REPLICASET"
  provider_name = "AWS"
  provider_region_name = var.region
  provider_instance_size_name = "M0"  # Free tier
  provider_backup_enabled = false
}

resource "mongodbatlas_database_user" "db_user" {
  username           = var.db_user
  password           = var.db_password
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_project_ip_access_list" "ip_whitelist" {
  project_id = mongodbatlas_project.project.id
  cidr_block = var.access_cidr
  comment    = "Added via Terraform"
}
