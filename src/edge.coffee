os = require 'os'

class Edge

    #
    # Base class / interface for an edge
    # 
    # - Represents a connection to another node
    # 
    # - Defines the abstraction necessary to
    #   support multiple transport types in
    #   the proxy tree.
    # 


    # 
    # connection - Contains the connection object
    #              to be wrapped into the edge 
    #              interface. 
    #             
    # opts       - If connected is null the opts
    #              are used to connect a new Edge
    #              as follows:
    # 
    # 
    #              // config step
    #              edge = new Edge( null, {
    #                  connect: { 
    #                     /* parameters to connect */  
    #                  } 
    #              });
    #
    #              // connect with callback
    #              edge.connect( function(connectedThing) {
    #                  /* on connection established */
    #              });
    
    constructor: (@connection, @opts = {}) ->

        #
        # Edge interface should attach reference to itself on
        # the connection to enable behaviours on disconnect
        #

        @connection._edge = this if @connection


    connect: (onConnect) ->

        #
        # make pretend connection 
        # 

        connectedThing = {
            id: 'LOCAL_ID'
        }
        @connection = connectedThing


        #
        # TODO: onConnect callback in handshake success callback
        #

        @handshake()


        #
        # callback with self as connected Edge instance
        #

        onConnect this if onConnect instanceof Function


    handshake: ->

        @send 'event:connect'

            type: @opts.mode
            globalId: @globalId() 

        
    send: (event, payload) -> 

        @sentAmessage = 

            event: event
            payload: payload



    #
    # edge defines localId()
    # 
    # - MUST be unique among all 
    #   locally attached edges 
    #

    localId: -> 
        return 'LOCAL_ID' unless @connection
        @connection.id


    #
    # edge must define globalId() to be unique throughout
    # the entire system
    # 
    # it defaults to hostname%pid
    #

    globalId: -> os.hostname() + '%' + process.pid



module.exports = Edge
