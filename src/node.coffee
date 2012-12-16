class Node

    #
    # Maintain a list of 'entities' attached
    # Each edge represents an attached node
    #

    @edges: {}

    @start: (opts = {}) -> 

        adaptor = opts.listen.adaptor || 'socket.io'
        port = process.env.PORT || opts.listen.port || 3001

        switch adaptor

            when 'socket.io'

                server = require "./adaptors/#{ adaptor }-adaptor"
                server.listen opts, @connect

            else throw "adaptor not implemented: #{adaptor}"

    @connect: (edge) => 

        #
        # called when an edge connects
        #

        @edges[ edge.localId() ] = edge

    @disconnect: (edge) => 

        #
        # called when an edge disconnects
        # 
        # - set disconnected time
        # - reap later, or report
        # 

        @edges[ edge.localId() ].disconnected =

            timestamp: new Date()


module.exports = Node
