# MongoDB configuration
app = require '../app'
mongodb = require 'mongodb'

server = new mongodb.Server app.set('mongo host'), app.set('mongo port'), {auto_reconnect: true}
connector = new mongodb.Db app.set('mongo name'), server 

exports.open = connector.open
