#!/bin/bash
# for CentOS7/RHEL7
# 2020-04

sudo yum remove docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-engine

sudo yum install -y yum-utils \
        device-mapper-persistent-data \
        lvm2 \
        curl \
        unzip

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly
sudo yum install -y docker-ce

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
systemctl status docker.service

echo 'Assign your user account to docker group:'
echo 'sudo usermod -a -G docker <your login name>'

# end.
