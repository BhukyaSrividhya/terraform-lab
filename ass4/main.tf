terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

module "nginx_8081" {
  source         = "./modules/nginx_container"
  container_name = "nginx-8081"
  container_port = 8081
}

module "nginx_8082" {
  source         = "./modules/nginx_container"
  container_name = "nginx-8082"
  container_port = 8082
}

output "urls" {
  value = [
    module.nginx_8081.container_url,
    module.nginx_8082.container_url
  ]
}
