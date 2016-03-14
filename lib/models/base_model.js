import {request} from '../util'

// This is a helper class to manage base models; that is models who are
// accessed directly in the api (ex: /v2/staff/:id), as opposed to models
// who are nested within other models
// (ex: v2/staff/:id/emergency-contacts/:emergency_contact_id)

export default class BaseModel {
  constructor (client, name) {
    this.client = client
    this.name = name
  }

  create (entity = '', opts) {
    return request(this.client, opts, {
      method: 'POST',
      path: this.name,
      entity: entity
    })
  }

  index (params, opts) {
    return request(this.client, opts, {
      path: this.name,
      params: params
    })
  }

  get (id, params, opts) {
    return request(this.client, opts, {
      path: `/${this.name}/${id}`,
      params: params
    })
  }

  update (id, entity = '', opts) {
    return request(this.client, opts, {
      method: 'PUT',
      path: `/${this.name}/${id}`,
      entity: entity
    })
  }

  delete (id, opts) {
    return request(this.client, opts, {
      method: 'DELETE',
      path: `/${this.name}/${id}`
    })
  }
}
