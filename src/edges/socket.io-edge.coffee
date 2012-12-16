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
                        a: 
                            type: @opts.mode
                            globalId: @globalId()
                        b:
                            payload


                console.log "recieve:", 'event:register', payload

            @connection.on 'event:edge:create', (payload) => 

                switch @opts.mode

                    when 'proxy'

                        #
                        # mark as passed through proxy
                        #

                        payload.proxied or= []
                        payload.proxied.push @globalId()
                        @opts.uplink.send 'event:edge:create', payload

                    when 'root'

                        proxied = 'none'
                        proxied = payload.proxied[0] if payload.proxied

                        console.log "NEW EDGE %s:%s ---- %s:%s  proxied: %s ", 
                        payload.a.type, payload.a.globalId, 
                        payload.b.type, payload.b.globalId,
                        proxied

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

