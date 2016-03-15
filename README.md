# Carrot API Client Base

[![Build Status](https://travis-ci.org/carrot/carrot-api-client-base.svg?branch=master)](https://travis-ci.org/carrot/carrot-api-client-base)

Carrot API Client Base is a scaffolding project built on top of [rest.js](https://github.com/cujojs/rest) that helps rapidly build promise based API clients that follow [Carrots Restful API Spec](https://github.com/carrot/restful-api-spec).

Before getting into anything, you should check out the [Carrot API Node Client](https://github.com/carrot/carrot-api-node) file to get a general idea of how easy it is to build out a full client.

# Usage

## Defining the Client

To create a new API client, simply rename `RestAPI` to the name of your actual API, then in `lib/config.js`, enter the URL for your rest API. By default, the staging environment is selected. With the env set to `production` or `test`, it will use the appropriate links.

#### Prepare Models

This method allows you to build your model endpoints, which are defined by [this spec](https://github.com/carrot/restful-api-spec#determine-interface-model-types).

## Using the Client

Now that we've defined our client, we can start using it.

First, you'll need to create an instance of your API client:

```js
let API = new MyApi("apiKey")
```

The `apiKey` parameter is optional and you may decide to use it or not, depending on your use case. From the API's perspective, adding the api key parameter will apply an `Authentication` header to all of your requests (so no need to add it to every request).

If you have an already initialized instance with no api key, and would like to add one later, you can simply do this through the `apiKey` property on the instance at any time. For example:

```js
let API = new myAPI()
API.apiKey = 'xxx'
console.log('Now I can make authenticated requests!')
```

#### Models

All endpoints must be accessed through models.

After you have created an API object and have it stored in a variable (let's say API), you can access the models like this:

```js
API.modelName
```

#### Available methods

In the [API Spec](https://github.com/carrot/restful-api-spec), we'll notice up to five different types of methods documented per model. This is how they map to this library:

```
Create  =>  .create
Index   =>  .index
Show    =>  .get
Update  =>  .update
Delete  =>  .delete
```

#### Example Method Call

```js
API.usersRepos.index('BrandonRomano')
  .then(console.log)
  .catch(console.error)
```

#### Segment Parameters

Looking at the example above, we note that the URL segment parameter id is passed in the first parameter. The convention for URL segment parameters is that they are the first parameters.

If we had two URL segment parameters, the endpoint would look something like this:

```js
API.exampleModel.fetch(1, 2)
  .then (res) ->
    # TODO
  .catch (err) ->
    # TODO
```

#### All Other Parameters

Any other parameters after the segment parameters follow this structure:

- `GET` methods: segment params, query string params, _overrides_
- `POST` methods: segment params, request entity, _overrides_
- `PUT` methods: segment params, request entity, _overrides_
- `DELETE` methods: segment params, _overrides_

The `overrides` in the final parameter slot for each method accepts an optional object that allows you to override any part of the request that you'd like to modify. This object is merged with priority over the existing params then passed into [rest.js](https://github.com/cujojs/rest). You can find a list of [the potential properties you can use in the overrides object here](https://github.com/cujojs/rest/blob/master/docs/interfaces.md#common-request-properties). In practice, you will probably never need to use this, but in case you do, you are able to modify the request in any way you'd like before it's sent using this argument.

## Deploying

Since this project is written in ES2015, it needs to be compiled before it's published. To compile, run `make build`, and to revert run `make unbuild`. For a one shot publish, you can run `make publish`, and it will build, publish to npm, then unbuild back to default.

## Testing

This library is set up by default to use [ava](https://github.com/sindresorhus/ava) for tests. Ava is a fairly simple test runner that works nicely with es6. To run tests, use `npm test`. To generate code coverage, use `npm run coverage`.

# License

[MIT](/LICENSE.md)
