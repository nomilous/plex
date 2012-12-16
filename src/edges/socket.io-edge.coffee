Edge     = require '../edge'
ioClient = require 'socket.io-client'

class SocketIoEdge extends Edge

    constructor: (@socket, @opts = {}) ->

        #
        # nothing to do if socket is defined
        #

        return if @socket

        unless @opts.connect and @opts.connect.uri

            throw 'SocketIoEdge requires connect.uri'

    connect: (onConnect) -> 

        @socket = ioClient.connect @opts.connect.uri

        @socket.on 'connect', ->

            onConnect @socket

    localId: -> @socket.id


module.exports = SocketIoEdge

