should = require 'should'
edges  = require '../lib/edge'

describe 'edge', -> 

    it '.connect() returns a connected edge', (done) -> 

        edges.connect(

            connect:
                adaptor: 'base'

        ).should.eql 

            connected: true

        done()
