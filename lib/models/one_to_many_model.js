import {request} from '../util'

// This is a helper class to manage the one to many models; that is
// models who belong to another model in a one-to-many relationship.
//
// In a SQL database, these are models who usually have a reference
// to their parent model via a foreign key.

export default class OneToManyModel {
  constructor (client, parentModelName, nestedModelName) {
    this.client = client
    this.parent = parentModelName
    this.nested = nestedModelName
  }

  create (id, entity = '', opts) {
    return request(this.client, opts, {
      method: 'POST',
      path: `/${this.parent}/${id}/${this.nested}`,
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
