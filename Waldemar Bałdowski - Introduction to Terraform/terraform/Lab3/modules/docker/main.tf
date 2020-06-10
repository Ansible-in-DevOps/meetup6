provider "docker" {
  version = "2.7.0"
}

resource "docker_image" "image" {
  name = var.dockerImage
}

resource "docker_container" "container" {
  image = docker_image.image.name
  name  = var.containerName
  ports {
    internal = var.portInternal
    external = var.portExternal
  }
}
