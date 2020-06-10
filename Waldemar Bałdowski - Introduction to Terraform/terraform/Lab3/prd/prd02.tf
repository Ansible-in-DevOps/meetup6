module "prd02" {
  source = "../modules/docker"
  #dockerImage = "nginx:latest"
  dockerImage = "nginx:1.17.10"
  portExternal = "91"
  containerName = "prd02"
}
