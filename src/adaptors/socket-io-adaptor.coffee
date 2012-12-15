io           = require 'socket.io'
Adaptor      = require '../adaptor'
SocketIoEdge = require '../edges/socket-io-edge'


class SocketIoAdaptor

    @listen: ( opts, onConnect ) ->

        Adaptor.validate opts, onConnect

        throw 'undefined opts.port' unless opts.port

        server = io.listen opts.port

        server.on 'connection', (socket) -> 

            #
            # wrap connection socket into the Edge interface
            # and callback
            # 

            onConnect new SocketIoEdge socket

        return server


module.exports = SocketIoAdaptor
