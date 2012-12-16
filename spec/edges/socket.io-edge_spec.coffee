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
                on: (event, payload) ->
                emit: (event, payload) ->

            @edge = new SocketIoEdge mockSocket 


        it 'uses the connected socket.io id as localId()', (done) ->

            @edge.localId().should.equal 'socket.io.id'
            done()
        

    describe 'at the client side', -> 

        server  = undefined
        port    = 3000

        before (done) ->

            @serversSocket = undefined

            server = require('socket.io').listen port

            server.on 'connection', (connected) =>
                @serversSocket = connected

            done()

        after ->

        #     # adaptor.close() 

        it 'throws on missing connect.uri', (done) ->

            try
                edge = new SocketIoEdge null, {}

            catch error

                error.should.equal 'SocketIoEdge requires connect.uri'
                done()



        it 'connects to the server using opts.connect if connected is null', (done) ->

            edge = new SocketIoEdge null,
                mode: 'proxy'
                connect: 
                    uri: "http://localhost:#{  port  }"

            edge.connect (newEdge) => 

                serverID = @serversSocket.id
                console.log "SERVER:", serverID

                clientID = newEdge.localId()
                console.log "CLIENT:", clientID

                serverID.should.equal clientID
                done()

