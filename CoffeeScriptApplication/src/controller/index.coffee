
# Main request handler
run = (request, response) ->
  response.send('hello world')

exports.run = run;