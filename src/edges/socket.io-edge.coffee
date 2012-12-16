Edge     = require '../edge'
ioClient = require 'socket.io-client'

class SocketIoEdge extends Edge

    constructor: (@connection, @opts = {}) ->

        #
        # nothing to do if socket is defined
        #

        @isClient = false

        if @connection


            #
            # temporary
            #

            @connection.on 'event:register', (payload) -> 

                console.log "recieve:", 'event:register', payload 


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

