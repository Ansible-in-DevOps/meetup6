provider "docker" {
  version = "2.7.0"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.containerName
  ports {
    internal = var.portInternal
    external = var.portExternal
  }
}

output "containerID" {
  value = "${docker_container.nginx.id}"
}
