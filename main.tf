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

data "mongodbatlas_project" "project" {
  name   = "terraform-jenkins-mongo-automation"
  org_id = "66e862049dd1012687231d68"
}

resource "mongodbatlas_cluster" "cluster" {
  project_id                   = data.mongodbatlas_project.project.id
  name                         = "terraform-jenkins-mongo-automation-cluster"
  cluster_type                 = "REPLICASET"
  provider_name                = "AWS"
  provider_region_name         = var.region
  provider_instance_size_name = "M0"  # Free tier
  cloud_backup                 = false
}

resource "mongodbatlas_database_user" "db_user" {
  username           = var.db_user
  password           = var.db_password
  project_id         = data.mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_project_ip_access_list" "ip_whitelist" {
  project_id = data.mongodbatlas_project.project.id
  cidr_block = var.access_cidr
  comment    = "Added via Terraform"
}
