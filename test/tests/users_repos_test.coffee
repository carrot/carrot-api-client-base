exports = describe 'users_repos', ->

  it 'users_repos.bulk_fetch() should return an array of repos', ->
    API.users_repos.bulk_fetch('BrandonRomano')
      .then (res) ->
        repos = res.data
        repos.should.be.an('array')
        repos[0].owner.login.should.equal('BrandonRomano')
