# Lab2
In this lab you will use variables for terraform configuration.
Next you will provision simple Docker container resource.

1. Prepare terraform configuration.
```
Configuration: second_container.tf
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


Variables: vars.tf
variable "containerName" {
    default = "lab2"
}

variable "portInternal" {
    default = "80"
}

variable "portExternal" {
    default = "81"
}

You can validate configuration (syntax) using command:
terraform validate
```

4. Check providers configured in *.tf files. Next initialize working dir.
```
terraform providers
terraform init
```

5. Check current state.
```
terraform show

Note: You should get "No state." output. It means that infra was not yet provisioned.
```

6. Run terraform plan and deploy. Next validate state.
```
Save plan to file:
terraform plan -out=plan-lab2

Deploy plan from file:
terraform apply plan-lab2

Check status:
terraform show
```

6. Check container
```
docker ps -a
docker images
links http://localhost:81
```

7. Destroy infrastructure
```
terraform destroy

Next check status:
docker ps -a
docker images
```
