module "prd01" {
  source = "../modules/docker"
  #dockerImage = "nginx:latest"
  dockerImage = "nginx:1.17.10"
  portExternal = "90"
  containerName = "prd01"
}
