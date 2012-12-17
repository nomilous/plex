class Node

    #
    # Maintain a list of 'entities' attached
    # Each edge represents an attached node
    #

    @edges: {}

    @uplink: undefined


    @start: (opts = {}) -> 

        @listen opts


    @listen: (opts) ->

        adaptor = opts.listen.adaptor || 'socket.io'
        port = process.env.PORT || opts.listen.port || 3001
        opts.edges = @edges 
        
        switch adaptor

            when 'socket.io'

                @adaptor = require "./adaptors/#{ adaptor }-adaptor"
                @adaptor.listen opts, @onConnect

            else throw "adaptor not implemented: #{adaptor}"


    @connect: (opts) -> 

        UplinkClass = require "./edges/#{  opts.connect.adaptor  }-edge"

        @uplink = new UplinkClass null, opts

        opts.uplink = @uplink

        @uplink.connect =>

            if opts.connect.onConnect

                opts.connect.onConnect @uplink


    @onConnect: (edge) => 

        #
        # called when an edge connects
        #

        @edges[ edge.localId() ] = edge


    @onDisconnect: (edge) => 

        #
        # called when an edge disconnects
        # 
        # - set disconnected time
        # - reap later, or report
        # 

        @edges[ edge.localId() ].disconnected =

            timestamp: new Date()


module.exports = Node
