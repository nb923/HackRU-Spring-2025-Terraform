variable "public_key" {
  description = "MongoDB Atlas public key"
  type        = string
}

variable "private_key" {
  description = "MongoDB Atlas private key"
  type        = string
}

variable "atlasprojectid" {
  description = "MongoDB Atlas project ID"
  type        = string
}

variable "cluster_region" {
  description = "MongoDB Atlas cluster region"
  type        = string
}

variable "atlas_provider_name" {
  description = "MongoDB Atlas cloud provider name"
  type        = string
}

variable "atlas_provider_instance_size_name" {
  description = "MongoDB Atlas provider instance size name"
  type        = string
}

variable "auto_scaling_disk_gb_enabled" {
  description = "Enable auto-scaling for disk space"
  type        = bool
}

variable "mongo_db_major_version" {
  description = "MongoDB major version"
  type        = string
}

variable "mongodb_atlas_database_username" {
  description = "MongoDB Atlas database username"
  type        = string
}

variable "mongodb_atlas_database_password" {
  description = "MongoDB Atlas database password"
  type        = string
}
