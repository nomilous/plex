BaseAdaptor = require './base-adaptor'

module.exports = class SocketIoAdaptor extends BaseAdaptor

    constructor: (@context) ->

        console.log '\nSocketIoAdaptor() with:', @context

        return @listen()

    listen: ->

        @validate @context






# io           = require 'socket.io'
# Adaptor      = require '../adaptor'
# SocketIoEdge = require '../edges/socket.io-edge'


# class SocketIoAdaptor

#     @listen: ( @context, onConnect ) ->

#         console.log '\nSocketIoAdaptor().listen() with:', @context

#         Adaptor.validate @opts, onConnect

#         unless @opts.listen and @opts.listen.port

#             throw 'undefined opts.port' 

#         _adaptor = this

#         server = io.listen @opts.listen.port, =>

#             @opts.listen.onListen _adaptor if @opts.listen.onListen

#         server.on 'connection', (socket) => 

#             #
#             # wrap connection socket into the Edge interface
#             # and callback
#             # 

#             edge = new SocketIoEdge socket, @opts

#             @opts.listen.onConnect edge if @opts.onConnect

#             onConnect edge

#         return server

# module.exports = SocketIoAdaptor
