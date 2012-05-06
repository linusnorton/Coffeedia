

# /rate
#
# Main request handler
module.exports = (request, response) ->
    response.render 'rate', rate: true
