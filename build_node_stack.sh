#!/bin/bash

# Update/Upgrade Ubuntu
cd /
sudo apt update
sudo apt upgrade

# Install Postgres
sudo apt install postgresql postgresql-contrib
sudo service postgresql start
# sudo -u [username] psql
sudo -u postgres psql

# Install Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Create package.json file
npm init

# Install Expess
npm install express

# Install nodemon (so that changes to the app don't require a restart)
sudo npm insall -g nodemon
npm install --save-dev nodemon
# without nodemon installed, to start app you'd run "node index.js"
# with nodemon installed, to start app you'll run "nodemon index.js"
