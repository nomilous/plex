BaseAdaptor  = require './base-adaptor'
io           = require 'socket.io'
SocketIoEdge = require '../edges/socket.io-edge'

#
# https://github.com/LearnBoost/socket.io/wiki/Exposed-events
#

module.exports = class SocketIoAdaptor extends BaseAdaptor

    listen: ->

        #console.log '\nSocketIoAdaptor() with:', @context

        unless @context.listen and @context.listen.port

            throw 'undefined listen.port'


        @server = io.listen @context.listen.port, =>

            if @context.listen.onListen
            
                @context.listen.onListen this

        @server.on 'connection', (socket) => 

            edge = @insertEdge SocketIoEdge, socket

            if @context.listen.onConnect
            
                @context.listen.onConnect edge
