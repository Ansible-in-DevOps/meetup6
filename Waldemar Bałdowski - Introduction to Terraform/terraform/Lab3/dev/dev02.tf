module "dev02" {
  source = "../modules/docker"
  dockerImage = "nginx:latest"
  portExternal = "81"
  containerName = "dev02"
}
