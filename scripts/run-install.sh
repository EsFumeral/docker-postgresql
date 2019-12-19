#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get remove docker docker-engine docker.io docker-compose
sudo apt-get autoremove
sudo apt-get install docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
sudo useradd -p $(openssl passwd -1 docker) docker -g docker
sudo mkdir -p /app/docker
