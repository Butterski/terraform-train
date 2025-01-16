terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Namespaces
resource "kubernetes_namespace" "backend" {
  metadata {
    name = "backend"
  }
}

resource "kubernetes_namespace" "redis" {
  metadata {
    name = "redis"
  }
}

variable "backend_image" {
  description = "Backend image"
  default     = "nowatorski-backend:latest"
}

variable "frontend_image" {
  description = "Frontend image"
  default     = "nowatorski-frontend:latest"
}
