var express = require('express')
var app = express()

app.set('port', (process.env.PORT || 3000))

app.get('/', function(request, response) {
  response.setHeader('Content-Type', 'application/json');
  response.send({ success: true, message: 'Hello Node.js!' })
})

app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'))
})
