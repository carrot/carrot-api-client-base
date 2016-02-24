axios = require 'axios'

# This is a generic REST API client.
#
# This class must be extended to provide any useful functionality.
# When extending this class, be sure to override the prepare_models
# method, as well as the transform_request method (if needed).
class RestApi

  constructor: (@base_url) ->

  build: () ->
    context = this
    base_url = @base_url
    @client = axios.create(
      baseURL: base_url
      timeout: 2000
      transformRequest: [
        (data, headers) ->
          context.transform_request(data, headers)
      ]
    )
    @prepare_models(@client)
    return this

  # Prepares all of the models (overridable)
  prepare_models: (client) ->

  # Transforms a request (overridable)
  transform_request: (data, headers) ->

module.exports = RestApi
