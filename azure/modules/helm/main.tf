# Create namespace if it doesn't exist
resource "null_resource" "kube_config_dependency" {
  triggers = {
    kube_config_raw = var.kube_config_raw
  }
}

resource "kubernetes_namespace" "app_namespace" {
  count = var.namespace != "default" && var.kube_config_raw != "" ? 1 : 0
  
  metadata {
    name = var.namespace
    
    labels = merge(var.tags, {
      name = var.namespace
    })
  }

  depends_on = [null_resource.kube_config_dependency]
}

# Deploy Apache HTTP server using Helm
resource "helm_release" "httpd" {
  name       = var.app_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "apache"
  version    = var.chart_version
  namespace  = var.namespace

  # Wait for the deployment to be ready
  wait          = true
  wait_for_jobs = true
  
  # Force resource update
  force_update = true
  
  # Recreate resource if needed
  recreate_pods = true
  
  # Cleanup on fail
  cleanup_on_fail = true

  # Values for the Apache chart
  set = [
    {
      name  = "replicaCount"
      value = var.replica_count
    },
    {
      name  = "service.type"
      value = var.service_type
    },
    {
      name  = "service.port"
      value = var.service_port
    },
    {
      name  = "ingress.enabled"
      value = "false"
    },
    {
      name  = "resources.requests.cpu"
      value = "100m"
    },
    {
      name  = "resources.requests.memory"
      value = "128Mi"
    },
    {
      name  = "resources.limits.cpu"
      value = "200m"
    },
    {
      name  = "resources.limits.memory"
      value = "256Mi"
    },
    # Add common labels
    {
      name  = "commonLabels.environment"
      value = var.tags["Environment"]
    },
    {
      name  = "commonLabels.project"
      value = var.tags["Project"]
    }
  ]

  depends_on = [kubernetes_namespace.app_namespace]
}