#!/bin/bash

echo "removendo Docker caso tenha instalado"
apt-get remove docker docker-engine docker.io containerd runc

echo "atualizando server e instalando pacotes de permissão"
apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "Add Docker’s official GPG key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "instalando docker"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
