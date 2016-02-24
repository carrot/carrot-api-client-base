# Carrot API Client Base

[![Build Status](https://travis-ci.org/carrot/carrot-api-client-base.svg?branch=master)](https://travis-ci.org/carrot/carrot-api-client-base)

Carrot API Client Base is a scaffolding project built on top of [axios](https://github.com/mzabriskie/axios) that helps rapidly build promise based API clients that follow [Carrots Restful API Spec](https://github.com/carrot/restful-api-spec).

Before getting into anything, you should check out the [Github API](/examples/github_api.coffee) file to get a general idea of how easy it is to build out a client.  That file provides a fully functioning API client.

# Usage

## Defining the Client

To create a new API client, you're first going to want to start by extending the `RestApi` class, defined in the `lib/rest_api.coffee` file.

Your new class file will look something like this:

> Note: all code snippets are written in [CoffeeScript](http://coffeescript.org/)

```coffeescript
RestApi = require('../lib/rest_api')
BaseModel = require('../lib/models/base_model')
OneToManyModel = require('../lib/models/one_to_many_model')

class GithubApi extends RestApi

  constructor: () ->
    super("https://api.github.com")

  prepare_models: (client) ->
    @users = new BaseModel(client, 'users')
    @users_repos = new OneToManyModel(client, 'users', 'repos')

module.exports = GithubApi
```

#### The Constructor

In the constructor, we pass along the API base URL to our super class.

#### Prepare Models

This method allows you to build your model endpoints, which are defined by [this spec](https://github.com/carrot/restful-api-spec#determine-interface-model-types).

#### Transform Request

It's not illustrated above, but there is another method you can override from `RestApi` called `transform_request`.

This allows changes to the request data before it is sent to the server.

Here is some example usage of `transform_request` that converts a JSON payload request (axios's default) to application/x-www-form-urlencoded:

```coffeescript
# ...
class GithubApi extends RestApi
  # ...
  transform_request: (data, headers) ->
    str = []
    for p of data
      if data.hasOwnProperty(p) and data[p]
        str.push encodeURIComponent(p) + '=' + encodeURIComponent(data[p])
     str.join '&'
```

## Using the Client

Now that we've defined our client, we can start using it.

First, you'll need to create an instance of your API client:

```coffeescript
var API = new MyApi().build();
```

#### Models

All endpoints must be accessed through models.

After you have created an API object and have it stored in a variable (let's say API), you can access the models like this:

```coffeescript
API.model_name
```

#### Available methods

In the [API Spec](https://github.com/carrot/restful-api-spec), we'll notice up to five different types of methods documented per model. This is how they map to this library:

```
Create  =>  .fetch
Index   =>  .bulk_fetch
Show    =>  .fetch
Update  =>  .update
Delete  =>  .delete
```

#### Example Method Call

```coffeescript
API.users_repos.bulk_fetch('BrandonRomano')
  .then (res) ->
    repos = res.data
    console.log(repos)
  .catch (err) ->
    console.log(err)
```

#### Segment Parameters

Looking at the example above, we note that the URL segment parameter id is passed in the first parameter. The convention for URL segment parameters is that they are the first parameters.

If we had two URL segment parameters, the endpoint would look something like this:

```coffeescript
API.example_model.fetch(1, 2)
  .then (res) ->
    # TODO
  .catch (err) ->
    # TODO
```

#### All Other Parameters

All other parameters after the segment parameters follow the same structure that [axios](https://github.com/mzabriskie/axios) takes, so please refer to their documentation.

You can think of the segment parameters as the replacement of the url parameters in all axios calls.

# License

[MIT](/LICENSE.md)
