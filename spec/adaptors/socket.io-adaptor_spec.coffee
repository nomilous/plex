should          = require 'should'
SocketIoAdaptor = require '../../lib/adaptors/socket.io-adaptor'

describe 'SocketIoAdaptor', ->

    xit 'throws if listen.port is undefined', (done) ->

        try 
            adaptor = new SocketIoAdaptor
                listen:
                    adaptor: 'socket.io'

        catch error

            error.should.equal 'requires listen.port or listen.app'
            done()

    xit 'does not throw if listen.app is defined', (done) ->

        http = require('http')
            .createServer( (req, res) -> )
            .listen 3000 

        try 
            adaptor = new SocketIoAdaptor
                listen:
                    adaptor: 'socket.io'
                    app: http

        catch error
            error.should.not.equal error
            http.close()
            done()

        http.close()
        done()

    it 'uses listen.app', (done) -> 

        http = require('http')
            .createServer( (req, res) -> )
            .listen 3000

        adaptor = new SocketIoAdaptor
            edges: {}
            listen: 
                adaptor: 'socket.io'
                app: http
                onConnect: (socket) ->

                    #
                    # the client connected... shutdown
                    # 
                    
                    http.close()
                    done()

        #
        # connect the client
        #

        (require 'socket.io-client').connect "http://localhost:3000"


    xit 'callsback to listen.onListen if defined', (done) -> 

        new SocketIoAdaptor
                listen:
                    adaptor: 'socket.io'
                    port: 3000
                    onListen: (server) -> 
                        #console.log '\nSERVER: ', server
                        done()


    xit 'callsback to listen.onConnect if defined', (done) ->

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
