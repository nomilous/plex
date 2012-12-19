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

    constructor: (@connection, @context) ->


        console.log '\nBaseEdge() with:', @context

        if @connection

            #

        else 

            @validate @context



    validate: (context) ->

        throw 'undefined context' unless context

        unless context.connnect and context.connect.adaptor
            
            throw 'edge requires connect.adaptor'




    # connect: (onConnect) ->

    #     #
    #     # make pretend connection 
    #     # 

    #     connectedThing = {
    #         id: 'LOCAL_ID'
    #     }
    #     @connection = connectedThing


    #     #
    #     # TODO: onConnect callback in handshake success callback
    #     #

    #     @handshake()


    #     #
    #     # callback with self as connected Edge instance
    #     #

    #     onConnect this if onConnect instanceof Function


    # handshake: ->

    #     @send 'event:connect'

    #         type: @opts.mode
    #         globalId: @globalId() 

        
    # send: (event, payload) -> 

    #     @sentAmessage = 

    #         event: event
    #         payload: payload



    # #
    # # edge defines localId()
    # # 
    # # - MUST be unique among all 
    # #   locally attached edges 
    # #

    # localId: -> 
    #     return 'LOCAL_ID' unless @connection
    #     @connection.id


    # #
    # # edge must define globalId() to be unique throughout
    # # the entire system
    # # 
    # # it defaults to hostname%pid
    # #

    # globalId: -> os.hostname() + '%' + process.pid



module.exports = BaseEdge
