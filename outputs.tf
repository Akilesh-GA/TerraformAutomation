output "project_id" {
  value = mongodbatlas_project.project.id
}

output "cluster_name" {
  value = mongodbatlas_cluster.cluster.name
}

output "connection_string" {
  value = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
}
