service = require '../service/container'

# Handle the rate action
class RateController 
  constructor: (@request, @response) ->
  
  # /coffee/rate
  #
  # Connect to mongo and call the list function
  rate: =>
      service.db.collection 'coffee', @insert
       
  # Query the collection for items
  insert: (err, collection) =>
    review = { }
    username = @request.param 'user'
    score = @request.param 'score', 50
    tagList = @request.param 'tags', []
    review[username] = score
    update = { $addToSet: { tags: { $each: tagList }, review: review } }
    query = { _id: @request.param 'name' }
    
    collection.update query, update, { upsert: true, safe: true }, @display

  # Display result of update
  display: (err, result) =>
    if err?
      @response.send err.message
    else
      @response.send { result: result }

# Export bootstrap for the controller
module.exports = (request, response) ->
  controller = new RateController request, response
  controller.rate()