#!/bin/bash
# for CentOS7/RHEL7
# 2020-04

mkdir -p ~/terraform/bin
cd ~/terraform/bin

curl -L "https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip" -o ~/terraform/bin/terraform_0.12.24_linux_amd64.zip
unzip ~/terraform/bin/terraform_0.12.24_linux_amd64.zip

echo 'PATH=$PATH:~/terraform/bin' >> ~/.bashrc
source ~/.bashrc
export PATH=$PATH:~/terraform/bin

terraform version

# end.