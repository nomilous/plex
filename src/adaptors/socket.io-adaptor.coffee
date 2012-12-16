io           = require 'socket.io'
Adaptor      = require '../adaptor'
SocketIoEdge = require '../edges/socket.io-edge'


class SocketIoAdaptor

    @listen: ( @opts, onConnect ) ->

        Adaptor.validate @opts, onConnect

        unless @opts.listen and @opts.listen.port

            throw 'undefined opts.port' 

        _adaptor = this

        server = io.listen opts.listen.port, ->

            opts.onListen _adaptor if opts.onListen

        server.on 'connection', (socket) -> 

            #
            # wrap connection socket into the Edge interface
            # and callback
            # 

            edge = new SocketIoEdge socket, opts

            opts.onConnect edge if opts.onConnect

            onConnect edge

        return server

module.exports = SocketIoAdaptor
