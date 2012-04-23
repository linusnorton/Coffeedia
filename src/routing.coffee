module.exports = ->
	@get '/', require './controller/index' 
	@get '/coffee/list', require './controller/list'
	@get '/coffee/rate', require './controller/rate'
