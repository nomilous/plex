BaseAdaptor  = require './base-adaptor'
io           = require 'socket.io'
SocketIoEdge = require '../edges/socket.io-edge'

module.exports = class SocketIoAdaptor extends BaseAdaptor

    listen: ->

        console.log '\nSocketIoAdaptor() with:', @context

        unless @context.listen and @context.listen.port

            throw 'undefined listen.port'


        @server = io.listen @context.listen.port, =>

            if @context.listen.onListen
            
                @context.listen.onListen @server

        @server.on 'connection', (socket) => 

            @insertEdge SocketIoEdge, socket

            if @context.listen.onConnect
            
                @context.listen.onConnect socket
