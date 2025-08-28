# Create namespace if it doesn't exist
resource "kubernetes_namespace" "app_namespace" {
  count = var.namespace != "default" ? 1 : 0
  
  metadata {
    name = var.namespace
    
    labels = {
      name = var.namespace
    }
  }
}

# Deploy Apache HTTP server using Helm
resource "helm_release" "httpd" {
  name       = var.app_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "apache"
  version    = var.chart_version
  namespace  = var.namespace

  # Wait for the deployment to be ready
  wait          = false
  wait_for_jobs = false
  
  # Force resource update
  force_update = true
  
  # Recreate resource if needed
  recreate_pods = true
  
  # Cleanup on fail
  cleanup_on_fail = true

  # Simplified values for better reliability
  set {
    name  = "replicaCount"
    value = var.replica_count
  }
  
  
  
  set {
    name  = "service.port"
    value = var.service_port
  }
  
  set {
    name  = "ingress.enabled"
    value = "false"
  }
  
  set {
    name  = "resources.requests.cpu"
    value = "100m"
  }
  
  set {
    name  = "resources.requests.memory"
    value = "128Mi"
  }
  
  set {
    name  = "resources.limits.cpu"
    value = "200m"
  }
  
  set {
    name  = "resources.limits.memory"
    value = "256Mi"
  }

  depends_on = [kubernetes_namespace.app_namespace]
}