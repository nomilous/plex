should = require 'should'
Edge   = require '../lib/edge'

edge = new Edge()

describe 'Edge', ->

    it 'has an id', (done) -> 

        edge.id().should.equal 'EDGE_ID'
        done()

