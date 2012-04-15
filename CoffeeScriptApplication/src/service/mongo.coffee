
# MongoDB configuration
mongodb = require "mongodb"
server = new mongodb.Server 'localhost', 27017, {auto_reconnect: true}
connector = new mongodb.Db 'coffee', server 

exports.connect = (callback) -> connector.open callback