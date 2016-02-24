exports = describe 'users', ->

  it 'users.bulk_fetch() should return an array of users', ->
    API.users.bulk_fetch()
      .then (res) ->
        users = res.data
        users.should.be.an('array')
        user = users[0]
        user.login.should.equal("mojombo")
        user.type.should.equal("User")
      .should.be.fulfilled

  it 'users.fetch() should return a single user', ->
    API.users.fetch('BrandonRomano')
      .then (res) ->
        user = res.data
        user.login.should.equal("BrandonRomano")
      .should.be.fulfilled
