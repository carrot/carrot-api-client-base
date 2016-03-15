import {request} from '../util'

// This is a helper class to manage the many to many models; that
// is, models who are associated to other models in a many-to-many
// relationship.
//
// In a SQL database, these are usually models that associate two
// other models together via foreign keys.

export default class ManyToManyModel {
  constructor (client, parentModelName, nestedModelName) {
    this.client = client
    this.parent = parentModelName
    this.nested = nestedModelName
  }

  create (id, nested_id, entity = '', opts) {
    return request(this.client, opts, {
      method: 'POST',
      path: `/${this.parent}/${id}/${this.nested}/${nested_id}`,
      entity: entity
    })
  }

  index (id, params, opts) {
    return request(this.client, opts, {
      path: `/${this.parent}/${id}/${this.nested}`,
      params: params
    })
  }

  get (id, nested_id, params, opts) {
    return request(this.client, opts, {
      path: `/${this.parent}/${id}/${this.nested}/${nested_id}`,
      params: params
    })
  }

  update (id, nested_id, entity = '', opts) {
    return request(this.client, opts, {
      method: 'PUT',
      path: `/${this.parent}/${id}/${this.nested}/${nested_id}`,
      entity: entity
    })
  }

  delete (id, nested_id, opts) {
    return request(this.client, opts, {
      method: 'DELETE',
      path: `/${this.parent}/${id}/${this.nested}/${nested_id}`
    })
  }
}
