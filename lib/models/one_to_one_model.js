import {request} from '../util'

// This is a helper class to manage the nested singular models; that is
// models who belong to another model in a one-to-one relationship.
//
// In a SQL database, these are models who are usually referenced in
// another model via a foreign key (and only exist for this reason).

export default class OneToOneModel {
  constructor (client, parentName, name) {
    this.client = client
    this.parent = parentName
    this.name = name
  }

  create (id, entity = '', opts) {
    return request(this.client, opts, {
      method: 'POST',
      path: `/${this.parent}/${id}/${this.name}`,
      entity: entity
    })
  }

  get (id, params, opts) {
    return request(this.client, opts, {
      path: `/${this.parent}/${id}/${this.name}`,
      params: params
    })
  }

  update (id, entity = '', opts) {
    return request(this.client, opts, {
      method: 'PUT',
      path: `/${this.parent}/${id}/${this.name}`,
      entity: entity
    })
  }

  delete (id, opts) {
    return request(this.client, opts, {
      method: 'DELETE',
      path: `/${this.parent}/${id}/${this.name}`
    })
  }
}
