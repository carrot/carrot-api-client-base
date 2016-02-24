# This is a helper class to manage base models; that is models who are
# accessed directly in the api (ex: /v2/staff/:id), as opposed to models
# who are nested within other models
# (ex: v2/staff/:id/emergency-contacts/:emergency_contact_id)
class BaseModel
  constructor: (@client, @name) ->

  # ==============================
  # Creates a model
  # ==============================
  create: (form, conf) ->
    @client.post("/#{@name}", form, conf)
      .then (response) ->
        response

  # ==============================
  # Loads all models
  # ==============================
  bulk_fetch: (conf) ->
    @client.get("/#{@name}", conf)
      .then (response) ->
        response

  # ==============================
  # Loads a single model
  # ==============================
  fetch: (id, conf) ->
    @client.get("/#{@name}/#{id}", conf)
      .then (response) ->
        response

  # ==============================
  # Updates a model
  # ==============================
  update: (id, form, conf) ->
    @client.put("/#{@name}/#{id}", form, conf)
      .then (response) ->
        response

  # ==============================
  # Deletes a model
  # ==============================
  delete: (id, conf) ->
    @client.delete("/#{@name}/#{id}", conf)
      .then (response) ->
        response

module.exports = BaseModel
