#!/bin/bash

# create a network first
sudo docker network rm sp-example-net
sudo docker network create sp-example-net


# build  app1

# build  image
cd ~/dev/shinyproxy/app1
sudo docker build  --tag app1 .

# test
sudo docker run -it --rm -p 3838:3838 --volume /home/andrea/dev/shinyproxy/data:/root/data --name app1 app1


# build shinyproxy
cd ~/dev/shinyproxy/shinyproxy
sudo docker build --no-cache --tag shinyproxy .


sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /home/andrea/dev/shinyproxy/data:/root  --net sp-example-net -p 8080:8080   --name shinyproxy shinyproxy
