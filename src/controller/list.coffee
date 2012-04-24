service = require '../service/container'

# Handle the list action
class ListController 
  constructor: (@request, @response) ->
  
  # /coffee/list
  #
  # Connect to mongo and call the list function
  list: =>
      service.db.collection 'coffee', @find
       
  # Query the collection for items
  find: (err, collection) =>
    if err?
      @response.send err.message
    else
      name = @request.param "name", ''
      collection.find({ _id: { $regex : '^' + name, $options: 'i' } }).toArray @display
       
  # Display the items 
  display: (err, items) =>
    @response.send items

      
# Export bootstrap for the controller
module.exports = (request, response) ->
  controller = new ListController request, response
  controller.list()