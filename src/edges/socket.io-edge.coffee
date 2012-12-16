Edge     = require '../edge'
ioClient = require 'socket.io-client'

class SocketIoEdge extends Edge

    constructor: (@connection, @opts = {}) ->

        #
        # nothing to do if socket is defined
        #

        console.log 'INIT Edge with opts:', opts

        @isClient = false

        if @connection

            console.log "INIT protocol"

            #
            # temporary UNTESTED
            #

            @connection.on 'event:register', (payload) => 

                if @opts.mode == 'root'

                    #
                    # assemble topology at root
                    #

                else

                    @opts.uplink.send 'event:edge:create'
                        1: 
                            type: @opts.mode
                            globalId: @globalId()
                        2:
                            payload


                console.log "recieve:", 'event:register', payload

            @connection.on 'event:edge:create', (payload) => 

                console.log "recieve:", 'event:edge:create', payload


            return

        unless @opts.connect and @opts.connect.uri

            throw 'SocketIoEdge requires connect.uri'

    connect: (onConnect) ->

        @isClient = true 

        @connection = ioClient.connect @opts.connect.uri

        # darn this
        _mine = this

        @connection.on 'connect', ->

            _mine.handshake()

            onConnect _mine

    send: ( event, payload ) -> 

        console.log "send:", event, payload

        @connection.emit event, payload

    localId: -> 

        return @connection.id unless @isClient
        return @connection.socket.sessionid


module.exports = SocketIoEdge

