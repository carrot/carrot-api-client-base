# This is a helper class to manage the one to many models; that is
# models who belong to another model in a one-to-many relationship.
#
# In a SQL database, these are models who usually have a reference
# to their parent model via a foreign key.
class OneToManyModel
  constructor: (@client, @parent_model_name, @nested_model_name) ->

  # ==============================
  # Creates a model
  # ==============================
  create: (id, form, conf) ->
    @client.post("/#{@parent_model_name}/#{id}/#{@nested_model_name}",
      form, conf)
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

module.exports = OneToManyModel
