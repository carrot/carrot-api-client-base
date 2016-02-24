RestApi = require('../lib/rest_api')
BaseModel = require('../lib/models/base_model')
OneToManyModel = require('../lib/models/one_to_many_model')

# Here is an example usage with the Github v3 API
# https://developer.github.com/v3/
#
# It's worth noting that Github doesn't follow our
# standard to a tee, but it follows RESTful practices
# enough to illustrate usage.
class GithubApi extends RestApi

  constructor: () ->
    super("https://api.github.com")

  prepare_models: (client) ->
    @users = new BaseModel(client, 'users')
    @users_repos = new OneToManyModel(client, 'users', 'repos')

module.exports = GithubApi
