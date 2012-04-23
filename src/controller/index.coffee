
# Main request handler
get = (request, response) ->
  response.send('hello world')

module.exports = get;