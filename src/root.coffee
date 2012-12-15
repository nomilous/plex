root = 

    #
    # Maintain a list of 'entities' attached
    # Each edge represents an attached node
    # 
    #

    edges: {}

    start: (opts = {}) -> 

        transport = opts.transport || 'socket.io'
        port = process.env.PORT || opts.port || 3001

        switch transport

            when 'socket.io' then console.log 'start'

            else throw "transport not implemented: #{transport}"

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
