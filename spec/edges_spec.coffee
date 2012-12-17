should = require 'should'
edges  = require '../lib/edges'

describe 'edges', -> 

    it '.connect() returns a connected edge', (done) -> 

        edges.connect(

            connect:
                adaptor: 'base'

        ).should.eql 

            connected: true

        done()
