#!/bin/bash

# Install CURL
sudo apt install curl

# Install Atom
sudo snap install atom --classic

# Install Chrome
sudo apt install gdebi-core
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome-stable_current_amd64.deb
