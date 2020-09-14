#!/bin/bash

# create a network first
# sudo docker network rm sp-example-net
# sudo docker network create sp-example-net


# build icrm app
cd ~/dev/shinyproxy/shinyproxy
sudo docker build --tag shinyproxy .

# build  sample app
cd ~/dev/icrmkpi/sample-app
sudo docker build  --no-cache --tag marelli/sampleapp .

# build  image
cd ~/dev/icrmkpi/shinyproxy
sudo docker build --no-cache  -t icrm/shinyproxy .


sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --net sp-example-net -p 8080:8080   --name shinyproxy shinyproxy
