should       = require 'should'
SocketIoEdge = require '../../lib/edges/socket-io-edge' 

describe 'SocketIoEdge', ->

    beforeEach -> 

        mockSocket = 

            #
            # mock a connected instance of a socket.io socket
            #

            id: 'socket.io.id'

        @edge = new SocketIoEdge( mockSocket )


    it 'uses the socket.io id as localId()', (done) ->

        @edge.localId().should.equal 'socket.io.id'
        done()
    
