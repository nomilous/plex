should = require 'should'
edges  = require '../lib/edges'

describe 'edges', -> 

    it '.connect() returns a connected edge', (done) -> 

        edges.connect(

            connect:
                adaptor: 'example'
                
        ).should.eql 

            connected: true

        done()
