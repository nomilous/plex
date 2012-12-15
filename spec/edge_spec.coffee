should = require 'should'
Edge   = require '../lib/edge'

edge = new Edge()

describe 'Edge', ->

    it 'has an id', (done) -> 

        edge.localId().should.equal 'LOCAL_ID'
        done()

