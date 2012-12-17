should          = require 'should'
SocketIoAdaptor = require '../../lib/adaptors/socket.io-adaptor'

describe 'SocketIoAdaptor', ->

    it 'throws if listen.port is undefined', (done) ->

        try 
            adaptor = new SocketIoAdaptor
                listen:
                    adaptor: 'socket.io'

        catch error

            error.should.equal 'undefined listen.port'
            done()


    it 'callsback to listen.onListen if defined', (done) -> 

        new SocketIoAdaptor
                listen:
                    adaptor: 'socket.io'
                    port: 3000
                    onListen: (server) -> 
                        #console.log '\nSERVER: ', server
                        done()


    it 'callsback to listen.onConnect if defined', (done) ->

        sent = 'nothing yet'
        context = new (require '../../lib/context')
            # mock
            uplink: send: (e, p) -> sent = event: e, payload: p
            mode: 'leaf'
            listen:
                adaptor: 'socket.io'
                port: 3001
                onListen: (server) -> 

                    #
                    # its listening, connect a client to it
                    #

                    (require 'socket.io-client').connect "http://localhost:3001"

                onConnect: (socket) -> 

                    #console.log '\nCONTEXT: ', context
                    #console.log '\nHANDSHAKE:', sent
                    done()

        new SocketIoAdaptor context
