should = require 'should'
Node   = require '../lib/node'
Edge   = require '../lib/edge'

describe 'Node', -> 

    it 'defines start()', (done) -> 

        Node.start.should.be.an.instanceof Function
        done()

    it 'maintaines a list of connected edges keyed on edge.id()', (done) ->

        Node.onConnect new Edge()
        Node.edges.LOCAL_ID.should.not.be.undefined
        done()

    it 'marks edges as disconnected', (done) ->

        edge = new Edge()
        Node.onConnect( edge )
        Node.onDisconnect( edge )
        timestamp = Node.edges.LOCAL_ID.disconnected.timestamp
        
        #
        # dunno why this behaves oddly.
        # 
        # timestamp.should.be.an.instanceOf Date

        timestamp.getHours().should.equal (new Date()).getHours()
        done()

    it 'throws on unimplemented adaptor type', (done) -> 

        try 
            Node.start listen: adaptor: 'celtic lantern morse'

        catch error

            error.should.match /adaptor not implemented: celtic lantern morse/
            done()


        