{assert}  = require 'chai'
ast       = require '../apiary.ast.json'

{Collection, Resource} = require '../sdk'

describe 'Collections', ->
  describe 'parseResources', ->

    collection = new Collection {name: 'abc', uriTemplate: '/colls', actions: []}, {}

    it 'Badly prefixed resources are filtered out', ->
      collection.parseResources [new Resource {name: 'xxx', uriTemplate: '/otherprefix'}, {}]

      assert.equal 0, collection.resources.length

    it 'Templated subresource is added in', ->
      collection.parseResources [new Resource {name: 'xxx', uriTemplate: '/colls/{id}'}, {}]

      assert.equal 1, collection.resources.length

    it 'Proper subresource is added in', ->
      collection.parseResources [new Resource {name: 'xxx', uriTemplate: '/colls/{id}'}, {}]

      assert.equal '/colls/{id}', collection.resources[0].uriTemplate
