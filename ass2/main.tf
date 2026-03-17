terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

variable "filename" {
  default = "output.txt"
}

variable "message" {
  default = "Default environment"
}

resource "local_file" "env_file" {
  filename = "${path.module}/${var.filename}"
  content  = var.message
}

output "file_path" {
  value = local_file.env_file.filename
}
