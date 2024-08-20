#!/bin/bash

# codedeploy agent 설치
sudo apt update
sudo apt install -y ruby-full
sudo apt install -y wget
cd /home/ubuntu
sudo wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto

# java openjdk-17 version 설치
sudo apt install -y openjdk-17-jdk


# Private ECR 접근용 helper 설치
sudo apt install -y amazon-ecr-credential-helper

# Configuration 설정
mkdir /home/ubuntu/.docker
touch /home/ubuntu/.docker/config.json

echo "{"credsStore": "ecr-login"}" > /home/ubuntu/.docker/config.json