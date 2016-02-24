# This is a helper class to manage the nested singular models; that is
# models who belong to another model in a one-to-one relationship.
#
# In a SQL database, these are models who are usually referenced in
# another model via a foreign key (and only exist for this reason).
class OneToOneModel
  constructor: (@client, @parent_name, @name) ->

  # ==============================
  # Creates a model
  # ==============================
  create: (id, form, conf) ->
    @client.post("/#{@parent_name}/#{id}/#{@name}", form, conf)
      .then (response) ->
        response

  # ==============================
  # Loads a single model
  # ==============================
  fetch: (id, conf) ->
    @client.get("/#{@parent_name}/#{id}/#{@name}", conf)
      .then (response) ->
        response

  # ==============================
  # Updates a model
  # ==============================
  update: (id, form, conf) ->
    @client.put("/#{@parent_name}/#{id}/#{@name}", form, conf)
      .then (response) ->
        response

  # ==============================
  # Deletes a model
  # ==============================
  delete: (id, conf) ->
    @client.delete("/#{@parent_name}/#{id}/#{@name}", conf)
      .then (response) ->
        response

module.exports = OneToOneModel
