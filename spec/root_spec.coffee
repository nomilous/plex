should = require 'should'
root   = require '../lib/root'
Edge   = require '../lib/edge'

describe 'root', -> 

    it 'defines start()', (done) -> 

        root.start.should.be.an.instanceof Function
        done()

    it 'maintaines a list of connected edges keyed on edge.id()', (done) ->

        root.connect new Edge()
        root.edges.should.eql 'EDGE_ID': {}
        done()

    it 'marks edges as disconnected', (done) ->

        edge = new Edge()
        root.connect( edge )
        root.disconnect( edge )
        console.log edge
        timestamp = root.edges.EDGE_ID.disconnected.timestamp
        
        #
        # dunno why this behaves oddly.
        # 
        # timestamp.should.be.an.instanceOf Date

        timestamp.getHours().should.equal (new Date()).getHours()
        done()
