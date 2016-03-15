import rest from 'rest'
import mime from 'rest/interceptor/mime'
import errorCode from 'rest/interceptor/errorCode'
import pathPrefix from 'rest/interceptor/pathPrefix'
import defaultRequest from 'rest/interceptor/defaultRequest'
import timeout from 'rest/interceptor/timeout'
import config from './config'

export default class RestAPI {
  constructor (apiKey) {
    this.client = rest
      .wrap(mime)
      .wrap(errorCode)
      .wrap(pathPrefix, { prefix: config.basePath })
      .wrap(timeout, { timeout: config.timeout })
      .wrap(defaultRequest, {
        // This header decides how to encode the data you pass through. All
        // methods take a json object, and whatever you set the content type to
        // is how rest will convert it before sending to the server.
        headers: {
          'Content-Type': 'application/json; charset=utf-8'
        }
      })

    this.apiKey = apiKey

    this.prepareModels(this.client)
  }

  // This custom setter ensures that the API key can be changed at any time in
  // an instance's lifecycle and will work correctly.
  set apiKey (val) {
    if (!val) { return val }
    this._apiKey = val
    this.client = this.client.wrap(defaultRequest, {
      // An 'Authorization' header is the standard, but if an API key needs to
      // be passed in a different way, you can change it here.
      headers: { Authorization: val }
    })
    this.prepareModels(this.client)
    return val
  }

  get apiKey () {
    return this._apiKey
  }

  // Here, you should import the model you need from the `models` folder, and
  // initialize it properly for your API's data model.
  prepareModels (client) {
  }
}
