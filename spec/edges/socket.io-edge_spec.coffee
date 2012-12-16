should       = require 'should'
SocketIoEdge = require '../../lib/edges/socket.io-edge' 

describe 'SocketIoEdge', ->


    describe 'at the server side', -> 

        beforeEach -> 

            mockSocket = 

                #
                # mock a connected instance of a socket.io socket
                #

                id: 'socket.io.id'

            @edge = new SocketIoEdge mockSocket 


        it 'uses the connected socket.io id as localId()', (done) ->

            @edge.localId().should.equal 'socket.io.id'
            done()
        

    describe 'at the client side', -> 

        server  = undefined
        port    = 3000

        before (done) ->

            server = require('socket.io').listen port
            done()

        after ->

        #     # adaptor.close() 

        it 'throws on missing connect.uri', (done) ->

            try
                edge = new SocketIoEdge null, {}

            catch error

                error.should.equal 'SocketIoEdge requires connect.uri'
                done()



        xit 'connects to the server using opts.connect if connected is null', (done) ->

            