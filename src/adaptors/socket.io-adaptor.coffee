BaseAdaptor  = require './base-adaptor'
io           = require 'socket.io'
SocketIoEdge = require '../edges/socket.io-edge'

#
# https://github.com/LearnBoost/socket.io/wiki/Exposed-events
#

module.exports = class SocketIoAdaptor extends BaseAdaptor

    listen: ->

        #
        # Can be initialized with either a port to listen
        # on or an app (eg. express)
        #
        # <pre>
        # 
        # express = require 'express'
        # app = express()
        # app.listen 3000
        #  
        # plex.start
        #   ..
        #   ..
        #   listen:
        #     adaptor: 'socket.io'
        #     app: app
        #   ..
        #   ..
        # </pre>
        # 
        # 

        #console.log '\nSocketIoAdaptor() with:', @context

        unless @context.listen

            throw 'requires listen config'

        unless @context.listen.port or @context.listen.app

            throw 'requires listen.port or listen.app'


        @server = io.listen @context.listen.port, =>

            if @context.listen.onListen
            
                @context.listen.onListen this

        @server.on 'connection', (socket) => 

            edge = @insertEdge SocketIoEdge, socket

            if @context.listen.onConnect
            
                @context.listen.onConnect edge
