{assert}  = require 'chai'
ast       = require '../apiary.ast.json'

{Blueprint} = require '../sdk'

#$ = new Blueprint(bp).sdk()
#{headers, body} = $.gist.find()
#console.log "Response headers: %j, body: %s", headers, body

describe 'Blueprint SDK', ->
  $ = undefined

  before ->
    $ = new Blueprint(ast).sdk()

  describe 'I can call find for gist', ->
    headers = undefined
    body    = undefined

    before ->
      {headers, body} = $.gists.get()

    it 'I get proper Content-Type header', ->
      assert.equal 'application/json', headers['Content-Type']
