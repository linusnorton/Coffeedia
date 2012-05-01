service = require '../service/container'

# Handle the list action
class ListController 
    constructor: (@request, @response) ->
  
    # /view
    #
    # Connect to mongo and call the list function
    view: =>
        service.db.collection 'coffee', (err, collection) => 
            if err? 
                @response.send message
            else
                @find collection
         
    # Search for coffees using the name or tags
    find: (collection) =>
        query = _id: @request.param "name" 

        collection.find(query).toArray @display

    # Display the items 
    display: (err, item) =>
        total = 0

        for review in item[0].review
            for score of review
                total += parseInt review[score]

        rating = []
        ratingAverage = ( total / item[0].review.length ) / 10   
        ratingAverage = Math.round ratingAverage

        for num in [1..10]
            rating.push if num is ratingAverage then 'checked' else ''

        item[0].stars = rating
        console.log item[0].stars

        @response.render 'view', item[0]
      
      
# Export bootstrap for the controller
module.exports = (request, response) ->
    controller = new ListController request, response
    controller.view()