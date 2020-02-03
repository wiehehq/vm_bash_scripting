#!/bin/bash

# Update/Upgrade Ubuntu
cd ~
sudo apt update
sudo apt upgrade

# Install Postgres
sudo apt install postgresql postgresql-contrib
# DO NEXT LINE INSTEAD --- /usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start
sudo service postgresql start
# TO MAKE TABLES AND STUFF >>> sudo -u [username] psql
# sudo -u postgres psql

# Install Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Create package.json file
sudo npm init
# [react_app]
# [Enter]
# [Enter]
# [Enter]
# [Enter]
# [Enter]
# [Enter]
# [Enter]
# [Enter]
# [Enter]
# [yes]

# Install Expess
sudo npm install express

# Install nodemon (so that changes to the app don't require a restart)
sudo npm install -g nodemon
sudo npm install --save-dev nodemon

# without nodemon installed, to start app you'd run "node app.js"
# with nodemon installed, to start app you'll run "nodemon app.js"

touch app.js
# content of app.js is below

# const http = require('http');
#
# const hostname = '127.0.0.1';
# const port = 3000;
#
# const server = http.createServer((req, res) => {
#   res.statusCode = 200;
#   res.setHeader('Content-Type', 'text/plain');
#   res.end('Hello World');
# });
#
# server.listen(port, hostname, () => {
#   console.log(`Server running at http://${hostname}:${port}/`);
# });
