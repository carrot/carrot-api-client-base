exports.expect_error = (conf) ->
  conf.promise
    .then (res) ->
      res.status.should.not.equal(200)
    .catch (err) ->
      err.status.should.equal(conf.error_code)
    .should.be.fulfilled

exports.expect_array = (conf) ->
  conf.promise
    .then (res) ->
      content = res.data.content
      content.should.be.an('array')
      if conf.length?
        content.should.have.lengthOf(conf.length)
    .should.be.fulfilled
