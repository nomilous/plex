os = require 'os'

#
# Baseclass for an Edge
# 

class BaseEdge
    
    #
    # An Edge has two methods of contruction
    # 
    # 1. For the case of an incoming connection via an Adaptor
    #    it should be initialized with the connection object.
    # 
    # 2. For the case establishing a connection to a remote
    #    Adaptor the context should contain the connection
    #    parameters in the context.connect property
    #

    constructor: ->


    validate: (context) ->

        throw 'undefined context' unless context

        unless context.connect and context.connect.adaptor
            
            throw 'edge requires connect.adaptor'


    #
    # `edge.assign()` **an existing connection**
    # 
    # This is used by adaptors to initialize this edge
    # with the an already established connection
    #

    assign: (@context, @connection) -> 

        @handshake()


    #
    # `edge.handshake()` **sends event:connect to remote Adaptor**
    #

    handshake: -> 

        @send 'event:connect',
            mode: @context.mode
            globalId: @globalId()



    #
    # `edge.globalId()` **a globally unique id**
    #

    globalId: -> 

        os.hostname() + '%' + process.pid



    #
    # `edge.locaId()` **a locally unique id**
    # 
    # Implementation should override this
    #

    localId: -> 

        @connection.id


    #
    # `edge.connect()` **to a remote adaptor**
    # 
    # Implementation should override this
    #

    connect: (@context) ->

        console.log '\nBaseEdge.connect() with:', context

        @validate @context

        #
        # It pretends to connect to a remote Adaptor
        #

        true == true == true == true

        if @context.connect.mockConnection

            @connection = @context.connect.mockConnection
            @handshake()


    #
    # `edge.send()` **to send a message**
    # 
    # Implementation should override this.
    # 

    send: (event, payload) ->

        console.log '\nBaseEdge.send() with:', event, payload

        @connection.emit event, payload


module.exports = BaseEdge
