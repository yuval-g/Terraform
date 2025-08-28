output "aks_cluster_name" {
  value = module.aks.name
}

output "aks_kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}