#!/bin/bash

sudo apt-get update
sudo su
//Installs docker
curl https://get.docker.com/ | bash
sudo usermod -aG docker ubuntu
docker 


# // Get the instance info.   
# instance_url=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document`

# service_name="images"
# number_of_files=`aws s3 ls alexkilla.bucket-task-nearsoft | grep -e '.jpg\|.png' | wc -l`

# docker pull alexkilla/service_task:latest
# docker run -d -t -i --env NODE_ENV='production' \ 
# --env service_name='images' \
# --env instance_url=instance_url \
# --env number_of_files=number_of_files \
# -p 3000:3000 --name images_service alexkilla/task_service
# install docker
