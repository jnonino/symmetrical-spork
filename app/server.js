'use strict';

const express = require('express');

// App
const app = express();
app.get('/', (req, res) => {
  console.log('Request to /');
  res.send('Root Page - Please refer to /service or /__healthcheck__\n');
});

app.get('/service', (req, res) => {
  console.log('Request to /service');
  res.send('Service Executed\n');
});

app.get('/__healthcheck__', (req, res) => {
  console.log('Request to /__healthcheck__');
  res.send('Status: Up\n');
});

const HOST = '0.0.0.0';
const PORT = 8080;
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);