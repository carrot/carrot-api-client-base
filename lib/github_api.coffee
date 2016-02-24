RestApi = require('./rest_api')
BaseModel = require('./models/base_model')
OneToManyModel = require('./models/one_to_many_model')

class GithubApi extends RestApi

  constructor: () ->
    super("https://api.github.com")

  prepare_models: (client) ->
    @users = new BaseModel(client, 'users')
    @users_repos = new OneToManyModel(client, 'users', 'repos')

module.exports = GithubApi
