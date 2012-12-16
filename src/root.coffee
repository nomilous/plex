root = 

    #
    # Maintain a list of 'entities' attached
    # Each edge represents an attached node
    # 
    #

    edges: {}

    start: (opts = {}) -> 

        adaptor = opts.adaptor || 'socket.io'
        port = process.env.PORT || opts.port || 3001

        switch adaptor

            when 'socket.io'

                server = require "./adaptors/#{ adaptor }-adaptor"
                server.listen opts, root.connect

            else throw "adaptor not implemented: #{adaptor}"

    connect: (edge) -> 

        #
        # called when an edge connects
        #

        root.edges[ edge.localId() ] = edge

    disconnect: (edge) -> 

        #
        # called when an edge disconnects
        # 
        # - set disconnected time
        # - reap later, or report
        # 

        root.edges[ edge.localId() ].disconnected =

            timestamp: new Date()


module.exports = root
