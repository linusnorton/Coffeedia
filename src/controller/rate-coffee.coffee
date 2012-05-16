service = require '../service/container'

# Handle the rate action
class RateController 
    constructor: (@request, @response) ->
    
    # /coffee/rate
    #
    # Connect to mongo and call the list function
    rate: =>
        service.db.collection 'coffee', @insert

    # Get the tags from the request
    getTags: =>
        tags = @request.param 'tags', ''
        tags = tags.split ','
        tagList = []

        for item in tags
            tag = item.replace /^\s+|\s+$/g, ''

            if tag.length > 0
                tagList.push tag

        tagList

    # Query the collection for items
    insert: (err, collection) =>
        review = { }
        username = @request.param 'user', 'unknown'
        score = @request.param 'score', 50
        tagList = @getTags()

        review[username] = score
        source = @request.param 'source'

        update = 
            $addToSet: 
                tags: { $each: tagList }
                review: review

        if source? then update.$addToSet.source = source

        query = _id: @request.param('name').replace(/^\s+|\s+$/g, '')
        
        collection.update query, update, { upsert: true, safe: true }, @display

    # Display result of update
    display: (err, result) =>
        if err?
            @response.send err.message
        else
            @response.redirect '/view/' + @request.param 'name', 301

# Export bootstrap for the controller
module.exports = (request, response) ->
    controller = new RateController request, response
    controller.rate()