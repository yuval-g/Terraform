resource "kubernetes_ingress_v1" "httpd_ingress" {
  metadata {
    name      = "httpd-ingress"
    namespace = var.httpd_namespace
    annotations = {
      "kubernetes.io/ingress.class" = "alb"
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/*"
          path_type = "ImplementationSpecific"
          backend {
            service {
              name = "httpd-apache"
              port {
                number = var.httpd_service_port
              }
            }
          }
        }
      }
    }
  }

  depends_on = [module.helm_httpd, module.alb]
}
