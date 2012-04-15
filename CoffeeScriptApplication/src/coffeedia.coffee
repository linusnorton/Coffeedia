
app = require('express').createServer()
dic = {}

# Routing 
app.get '/', (req, res) -> require('./controller/index').run dic, req, res
app.get '/coffee/list', (req, res) -> require('./controller/list').run dic, req, res
app.get '/coffee/rate', (req, res) -> require('./controller/rate').run dic, req, res

# Configuration
require('./service/mongo').connect (err, db) -> 
  dic.mongo = db
  if err?
    @response.header "Content-Type", "text/plain"
    @response.send err.stack
  else
    app.listen 8080


