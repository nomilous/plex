should = require 'should'
proxy  = require '../lib/proxy'

describe 'proxy', -> 

    it 'defines start()', (done) -> 

        proxy.start.should.be.an.instanceof Function
        done()

    it 'throws on missing opts.connect', (done) -> 

        try 
            proxy.start {}

        catch error

            error.should.equal 'proxy requires opts.connect.adaptor parameters'
            done()

    describe 'connects to parent', ->

        server = undefined
        port   = 3000

        before (done) ->

            @serversSocket = undefined

            server = require('socket.io').listen port

            server.on 'connection', (connected) =>
                @serversSocket = connected

            done()

        it 'uses opts.connect parameters', (done) ->

            proxy.start

                connect:
                    adaptor: 'socket.io'
                    uri: "http://localhost:#{ port }"
                    onConnect: (connected) ->
                        done()

                listen: 
                    adaptor: 'socket.io'
                    port: 3001
    

    describe 'it listens for children', (done) ->

        port = 3002

        before (done) ->

            proxy.start
                connect:
                    adaptor: 'socket.io'
                    uri: "http://localhost:3001"
                listen: 
                    adaptor: 'socket.io'
                    port: port

            done()

        it 'can be connected to', (done) ->

            console.log "CONNECT"

            ioClient = require 'socket.io-client'

            client = ioClient.connect "http://localhost:#{ port }"

            client.on 'connect', -> 

                done()
