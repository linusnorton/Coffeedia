# Handle the rate action
class RateController 
  constructor: (@dic, @request, @response) ->
  
  # /coffee/rate
  #
  # Connect to mongo and call the list function
  run: =>
    @dic.mongo.collection 'coffee', this.insert
       
  # Query the collection for items
  insert: (err, collection) =>
    review = { }
    username = @request.param 'user'
    score = @request.param 'score', 50
    tagList = @request.param 'tags', []
    review[username] = score
    update = { $addToSet: { tags: { $each: tagList }, review: review } }
    query = { _id: @request.param 'name' }
    
    collection.update query, update, { upsert: true, safe: true }, this.display

  # Display result of update
  display: (err, result) =>
    if err?
      @response.send err.message
    else
      @response.send { result: result }

# Export bootstrap for the controller
exports.run = (dic, request, response) ->
  controller = new RateController dic, request, response
  controller.run()