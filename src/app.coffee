
app = module.exports = require('express').createServer()

# Settings
app.set 'baseDir', __dirname
app.configure require('./config/default')

# Routing 
require('./routing').call app

app.listen app.set('port')

