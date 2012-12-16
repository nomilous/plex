Edge     = require '../edge'
ioClient = require 'socket.io-client'

class SocketIoEdge extends Edge

    constructor: (@connection, @opts = {}) ->

        #
        # nothing to do if socket is defined
        #

        @isClient = false

        return if @connection

        unless @opts.connect and @opts.connect.uri

            throw 'SocketIoEdge requires connect.uri'

    connect: (onConnect) ->

        @isClient = true 

        @connection = ioClient.connect @opts.connect.uri

        # darn this
        _mine = this

        @connection.on 'connect', ->

            onConnect _mine

    localId: -> 

        return @connection.id unless @isClient
        return @connection.socket.sessionid


module.exports = SocketIoEdge

