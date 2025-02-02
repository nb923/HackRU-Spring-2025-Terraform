terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.10.0"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

resource "mongodbatlas_cluster" "shopping_cluster" {
  project_id             = var.atlasprojectid
  name                   = "ShoppingCluster"
  cluster_type = "REPLICASET"
  num_shards             = 1
  replication_factor     = 3
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled

  provider_name = "TENANT"
  backing_provider_name = "AWS"
  provider_instance_size_name = var.atlas_provider_instance_size_name
  provider_region_name = var.cluster_region
}

output "connection_strings" {
  value = ["${mongodbatlas_cluster.shopping_cluster.connection_strings}"]
}

resource "mongodbatlas_database_user" "my_user" {
    username = var.mongodb_atlas_database_username
    password = var.mongodb_atlas_database_password
    project_id = var.atlasprojectid
    auth_database_name = "admin"

    roles {
        role_name = "atlasAdmin"
        database_name = "admin"
    }
}


