Edge     = require '../edge'
ioClient = require 'socket.io-client'

module.exports = class SocketIoEdge extends Edge

    # constructor: (@connection, @opts = {}) ->

    #     #
    #     # nothing to do if socket is defined
    #     #

    #     console.log 'INIT Edge with opts:', opts

    #     @isClient = false

    #     if @connection

    #         @connection._edge = this if @connection

    #         #
    #         # temporary UNTESTED
    #         #

    #         @connection.on 'disconnect', =>

    #             #
    #             # child disconnected, propagate uptree 
    #             # 
    #             #    i.e. rootward, its a baobab
    #             #

    #             return if @opts.mode == 'root'


    #             id = @connection._edge.localId()
    #             remoteEdge = @opts.edges[id].remoteEdge
                
    #             console.log "disconnect:", remoteEdge

    #             @opts.uplink.send 'event:edge:disconnect'

    #                 a:
    #                     type: @opts.mode
    #                     globalId: @globalId()
    #                 b: remoteEdge


    #         @connection.on 'event:connect', (payload) => 

    #             if @opts.mode == 'root'

    #                 #
    #                 # assemble topology at root
    #                 #

    #             else

    #                 #
    #                 # A leaf has attaced to this proxy
    #                 # 
    #                 # - save its edge details for use 
    #                 #   on disconnect 

    #                 localId = @connection._edge.localId()
    #                 @opts.edges[localId].remoteEdge = payload

    #                 #
    #                 # inform uptree of new edge
    #                 #
                    
    #                 @opts.uplink.send 'event:edge:connect'
    #                     a: 
    #                         type: @opts.mode
    #                         globalId: @globalId()
    #                     b:  payload
                            


    #             console.log 'local  EDGE CONNECT', payload

    #         @connection.on 'event:edge:connect', (payload) => 

    #             switch @opts.mode

    #                 when 'proxy'

    #                     #
    #                     # mark as passed through proxy
    #                     #

    #                     payload.proxied or= []
    #                     payload.proxied.push @globalId()
    #                     @opts.uplink.send 'event:edge:connect', payload

    #                 when 'root'

    #                     console.log "remote EDGE CONNECT -- %s:%s <> %s:%s", 
    #                     payload.a.type, payload.a.globalId, 
    #                     payload.b.type, payload.b.globalId
                        

    #         @connection.on 'event:edge:disconnect', (payload) =>

    #              switch @opts.mode

    #                 when 'proxy'

    #                     #
    #                     # mark as passed through proxy
    #                     #

    #                     payload.proxied or= []
    #                     payload.proxied.push @globalId()
    #                     @opts.uplink.send 'event:edge:disconnect', payload

    #                 when 'root'

    #                     console.log "remote EDGE DISCONNECT -- %s:%s <> %s:%s", 
    #                     payload.a.type, payload.a.globalId, 
    #                     payload.b.type, payload.b.globalId

    #         return

    #     unless @opts.connect and @opts.connect.uri

    #         throw 'SocketIoEdge requires connect.uri'

    # connect: (onConnect) ->

    #     @isClient = true 

    #     @connection = ioClient.connect @opts.connect.uri

    #     # darn this
    #     _mine = this

    #     @connection.on 'connect', ->

    #         _mine.handshake()

    #         onConnect _mine

    # send: ( event, payload ) -> 

    #     console.log "send:", event, payload

    #     @connection.emit event, payload

    # localId: -> 

    #     return @connection.id unless @isClient
    #     return @connection.socket.sessionid




