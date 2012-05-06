module.exports = ->
    @get '/', require './controller/index' 
    @get '/rate', require './controller/rate' 
    @get '/view/:name', require './controller/view' 
    @get '/coffee/list', require './controller/list'
    @all '/coffee/rate', require './controller/rate-coffee'
