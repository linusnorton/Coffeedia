service = require '../service/container'

# Handle the list action
class ListController 
    constructor: (@request, @response) ->
  
    # /coffee/list
    #
    # Connect to mongo and call the list function
    list: =>
        service.db.collection 'coffee', (err, collection) => 
            if err? 
                @response.send message
            else
                @find collection
         
    # Search for coffees using the name or tags
    find: (collection) =>
        name = @request.param "term", ''
        tagList = name.replace ",", ""
        tagList = tagList.split ' '
        tagQuery = []

        # search for each tag
        for tag in tagList
            tagQuery.push
                tags: { $regex : '^' + tag, $options: 'i' }

        # search for the name
        query = $or: [
            { _id: { $regex : '^' + name, $options: 'i' } }
            { $and: tagQuery }
        ]

        collection.find(query).toArray @display

    # Display the items 
    display: (err, items) =>
        list = []
        for i in items
            list.push 
                label: i._id + ' (' + i.tags.join(', ') + ')'
                value: i._id

        @response.send list
      
      
# Export bootstrap for the controller
module.exports = (request, response) ->
    controller = new ListController request, response
    controller.list()