should          = require 'should'
SocketIoAdaptor = require '../../lib/adaptors/socket.io-adaptor'

describe 'SocketIoAdaptor', ->

    it 'throws if opts.port is undefined', (done) ->

        try 
            SocketIoAdaptor.listen {}, (newEdge) ->

        catch error

            error.should.equal 'undefined opts.port'
            done()


    describe 'listening', -> 

        ioClient  = require 'socket.io-client'
        adaptor = undefined
        port    = 3000

        before (done) ->

            @edge = undefined

            adaptor = SocketIoAdaptor.listen {

                port: port

            }, (newEdge) => 

                @edge = newEdge

            done()


        after ->

            # adaptor.close()


        it 'calls back with newEdge', (done) -> 

            client = ioClient.connect "http://localhost:#{  port  }"

            client.on 'connect', => 

                #
                # serverside callback populated @edge
                # 

                serversideID = @edge.localId()
                clientsideID = client.socket.sessionid

                serversideID.should.equal clientsideID
                done()
                