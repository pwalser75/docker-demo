#!/bin/bash

sudo echo "Europe/Zurich" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
