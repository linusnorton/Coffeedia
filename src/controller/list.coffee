# Handle the list action
class ListController 
  constructor: (@dic, @request, @response) ->
  
  # Connect to mongo and call the list function
  run: =>
    @dic.mongo.collection 'coffee', this.find
       
  # Query the collection for items
  find: (err, collection) =>
    if err?
      @response.send err.message
    else
      name = @request.param "name", ''
      collection.find({ _id: { $regex : '^' + name, $options: 'i' } }).toArray this.display
       
  # Display the items 
  display: (err, items) =>
    @response.send items
    
# Export bootstrap for the controller
exports.run = (dic, request, response) ->
  controller = new ListController dic, request, response
  controller.run()