#!bin/bash

# Set up Postgres
sudo apt install postgresql postgresql-contrib
sudo service postgresql start

# Set up Node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm init

# Set up Express
sudo npm install express

# Set up Nodemon
sudo npm install -g nodemon
sudo npm install --save-dev nodemon
touch app.js

# Edit app.js
# atom app.js
              # const http = require('http');
              #
              # const hostname = '127.0.0.1';
              # const port = 3000;
              #
              # const server = http.createServer((req, res) => {
              #  res.statusCode = 200;
              #  res.setHeader('Content-Type', 'text/plain');
              #  res.end('Hello World');
              # });
              #
              # server.listen(port, hostname, () => {
              #  console.log(`Server running at http://${hostname}:${port}/`);
              # });

# Start application
nodemon app.js

# Set up React
sudo npm install -g create-react-app
npx create-react-app awesome-project
cd awesome-project
npm start
