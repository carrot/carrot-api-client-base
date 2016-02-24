# This is a helper class to manage the many to many models; that
# is, models who are associated to other models in a many-to-many
# relationship.
#
# In a SQL database, these are usually models that associate two
# other models together via foreign keys.
class ManyToManyModel
  constructor: (@client, @parent_model_name, @nested_model_name) ->

  # ==============================
  # Creates a model
  # ==============================
  create: (id, nested_id, form, conf) ->
    @client.post("/#{@parent_model_name}/#{id}" +
      "/#{@nested_model_name}/#{nested_id}", form, conf)
      .then (response) ->
        response

  # ==============================
  # Loads all models
  # ==============================
  bulk_fetch: (id, conf) ->
    @client.get("/#{@parent_model_name}/#{id}/#{@nested_model_name}", conf)
      .then (response) ->
        response

  # ==============================
  # Loads a single model
  # ==============================
  fetch: (id, nested_id, conf) ->
    @client.get("/#{@parent_model_name}/#{id}/" +
      "#{@nested_model_name}/#{nested_id}", conf)
      .then (response) ->
        response

  # ==============================
  # Updates a model
  # ==============================
  update: (id, nested_id, form, conf) ->
    @client.put("/#{@parent_model_name}/#{id}/" +
      "#{@nested_model_name}/#{nested_id}", form, conf)
      .then (response) ->
        response

  # ==============================
  # Deletes a model
  # ==============================
  delete: (id, nested_id, conf) ->
    @client.delete("/#{@parent_model_name}/#{id}/" +
      "#{@nested_model_name}/#{nested_id}", conf)
      .then (response) ->
        response

module.exports = ManyToManyModel
