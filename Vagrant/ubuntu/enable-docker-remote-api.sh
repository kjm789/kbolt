#!/bin/bash

# Update docker.service to be binded to listening socket via tcp
echo "Binding docker.service to port 4243"
sudo sed -i 's/unix:\/\/.*/& -H tcp:\/\/0.0.0.0:4243/g' /lib/systemd/system/docker.service

# Reload unit files
echo "Reload daemon unit files"
sudo systemctl daemon-reload

# Restart the docker daemon with new options
echo "Restart docker daemon with new options"
sudo service docker restart 

# Test docker remote api endpoint /version
echo "Test docker remote api on port 4243"
curl -s -X GET http://localhost:4243/version 1>&2 >> /dev/null
echo "!! Everything is completed !!"
