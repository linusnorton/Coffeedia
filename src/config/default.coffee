# Dependencies
express = require 'express'
hulk = require 'hulk-hogan'

# Application default configuration
module.exports = ->
    baseDir = @set 'baseDir'

    # The port the application should run on
    @set 'port', 8080

    # Register hulk-hogan (mustache) views
    # register seems to have changd to engine in version 3
    #@engine '.html', hulk

    # Set the view directory and default options
    @set 'views', baseDir + '/src/view'
    @set 'view engine', 'html'
    @set 'view options',
        layout: 'layout/default'
        title: 'Coffeedia'

    # Set the app's public directory
    @use express.static(baseDir + '/public')
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()
    
    # Mount application routes
    @use @router
    
    # Mongo configuration
    @set 'mongo host', 'localhost'
    @set 'mongo port', 27017
    @set 'mongo name', 'coffee'
    
    require '../service/mongo'
