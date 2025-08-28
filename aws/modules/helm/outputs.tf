output "release_name" {
  description = "Name of the Helm release"
  value       = helm_release.httpd.name
}

output "release_namespace" {
  description = "Namespace of the Helm release"
  value       = helm_release.httpd.namespace
}

output "release_version" {
  description = "Version of the Helm release"
  value       = helm_release.httpd.version
}

output "release_status" {
  description = "Status of the Helm release"
  value       = helm_release.httpd.status
}

output "chart_version" {
  description = "Version of the Helm chart used"
  value       = helm_release.httpd.chart
}

output "chart_name" {
  description = "Name of the Helm chart used"
  value       = helm_release.httpd.chart
}

# Get service information
data "kubernetes_service" "httpd_service" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }
  
  depends_on = [helm_release.httpd]
}

output "service_name" {
  description = "Name of the Kubernetes service"
  value       = data.kubernetes_service.httpd_service.metadata[0].name
}

output "service_type" {
  description = "Type of the Kubernetes service"
  value       = try(data.kubernetes_service.httpd_service.spec[0].type, "")
}

output "service_ports" {
  description = "Ports exposed by the service"
  value       = try(data.kubernetes_service.httpd_service.spec[0].port, [])
}

output "load_balancer_ingress" {
  description = "Load balancer ingress points"
  value       = try(data.kubernetes_service.httpd_service.status[0].load_balancer[0].ingress, [])
}