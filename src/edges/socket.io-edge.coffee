BaseEdge     = require './base-edge'
ioClient = require 'socket.io-client'

module.exports = class SocketIoEdge extends BaseEdge

    connect: (@context) -> 

        #console.log 'SocketIoEdge.connect() with:', @context

        unless @context.connect and @context.connect.uri
        
            throw 'SocketIoEdge requires connect.uri'


        @connection = ioClient.connect @context.connect.uri


        #
        # Override localId() to use the socket.io-client sessionid
        #

        @localId = -> @connection.socket.sessionid

        @connection.on 'connect', =>

            @handshake()

            if @context.connect.onConnect instanceof Function

                @context.connect.onConnect this

        return this
