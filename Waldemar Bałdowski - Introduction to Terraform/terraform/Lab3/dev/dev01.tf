module "dev01" {
  source = "../modules/docker"
  dockerImage = "nginx:latest"
  portExternal = "80"
  containerName = "dev01"
}
