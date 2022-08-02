#!/bin/bash
# script para instalação do docker e permissões

echo "atualizando servidor e instalando pacotes"
apt-get update
apt-get install ca-certificates 
apt-get install curl 
apt-get install gnupg 
apt-get install lsb-release 

echo "Add Docker’s GPG key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
 	$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "instalando docker..."
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

systemctl enable docker
usermod -aG docker ${USER}
