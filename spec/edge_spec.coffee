should = require 'should'
Edge   = require '../lib/edge'

describe 'Edge', ->

    it 'has an id', (done) -> 

        edge = new Edge()
        edge.localId().should.equal 'LOCAL_ID'
        done()

    it 'can be initialized with a connected interface', (done) ->

        edge = new Edge {id: 'ASSIGNED_OBJECT"s_ID' }
        edge.localId().should.equal 'ASSIGNED_OBJECT"s_ID'
        done()
    