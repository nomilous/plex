root = 

    #
    # Maintain a list of 'entities' attached
    # Each edge represents an attached node
    # 
    #

    edges: {}

    start: (opts = {}) -> 

    connect: (edge) -> 

        #
        # called when an edge connects
        #

        root.edges[ edge.id() ] = edge

    disconnect: (edge) -> 

        #
        # called when an edge disconnects
        # 
        # - set disconnected time
        # - reap later, or report
        # 

        root.edges[ edge.id() ].disconnected =

            timestamp: new Date()


module.exports = root
