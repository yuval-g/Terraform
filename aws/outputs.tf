output "httpd_ingress_endpoint" {
  description = "The endpoint of the httpd ingress."
  value       = try(kubernetes_ingress_v1.httpd_ingress.status[0].load_balancer[0].ingress[0].hostname, "Load balancer not ready yet")
}