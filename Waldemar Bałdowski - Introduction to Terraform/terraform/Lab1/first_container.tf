provider "docker" {
  version = "2.7.0"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "lab1"
  ports {
    internal = 80
    external = 80
  }
}
