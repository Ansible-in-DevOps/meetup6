# Lab3
In this lab you will use module (template) for infrastructure provisioning.

1. Folder structure

| Folder name | File name | Description |
--- | --- | ---
modules/docker | main.tf | Config file for docker module
modules/docker | variables.tf | Vars file for docker module
modules/docker | output.tf  | Outputs from module
dev | dev01.tf, dev02.tf | Development infra definition
prd | prd01.tf, prd02.tf | Production infra definition

2. Configuration steps

- Prepare module content.
- Create dev/prd folders.
- Define resources using modules for dev/prd environment. Define proper variables for module.
- Enter dev/prd folders and deploy resources:
```
terrafirm init
terraform plan
terrafrom apply
``` 

4. Validate setup
```
docker ps
links http://localhost:<port per instance>
``` 

5. Destroy resources
```
terraform destroy

```
