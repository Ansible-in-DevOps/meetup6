# Lab1
In this lab you will install docker and terraform.
Next you will provision simple Docker container resource.

1. Install docker on RHEL7/CentOS7
```
chmod +x ./install_docker.sh
./install_docker.sh
```

2. Install terraform
```
chmod +x ./install_terraform.sh
./install_terraform.sh
```

3. Prepare terraform configuration
```
Configuration: first_container.tf

provider "docker" {
  version = "2.7.0"
}
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 80
  }
}

You can validate configuration (syntax) using command:
terraform validate

```

4. Check providers configured in *.tf files. Next initialize working dir.
```
terraform providers
terraform init

Next validate content inside .terraform folder:
ls -la  # note that .terraform folder was created
ls -la .terraform/plugins/linux_amd64/
```

5. Check current state.
```
terraform show

Note: You should get "No state." output. It means that infra was not yet provisioned.
```

6. Run terraform plan and deploy. Next validate state.
```
terraform plan
terraform apply
terraform show

Symbols in terraform plan output:
 +   create
 -   destroy
 -/+ replace (destroy and then create, or vice-versa if create-before-destroy is used in lifecycle)
 ~   update in-place
 <=  read (data sources)

Note that state file was created: 
ls -l terraform.tfstate
```

7. Check container
```
docker ps -a
docker images
links http://localhost:80
```

8. Change container configuration, for example external port from 80 to 8080
```
Next run again:
terraform apply
terraform show

IMPORTANT NODE:
Note from plan, that new container will be deployed, and old one will be removed.
```

9. Destroy infrastructure
```
terraform destroy

Next check status:
docker ps -a
docker images
```