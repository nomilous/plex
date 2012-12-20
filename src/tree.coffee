
#
# Tree is used internally by [Plex](plex.html) to manage
# and maintain the tree topology.
# 

class Tree

    constructor: (@context) -> 

        #
        # `tree.context` houses the [Context](context.html) 
        # of this [Node](node.html) 
        #
        # `tree.edges.local` houses the list of adjacent Nodes
        # in the branch rooted at this Node
        #
        # `tree.edges.remote` house remote edges (not adjacent)

        @edges = 
            local: {}
            remote: {}


    #
    # `tree.insertLocal()` **a new edge into the tree**
    #
    # **localEdge** - expects the [Edge](edge.html) that represents
    # the localside of the connection.
    # 
    # **connectData** - expects the payload of the **event:connect** 
    # message that was sent by the remote side at handshake
    # 

    insertLocal: (localEdge, connectData) -> 

        #
        # Create a record of the edge
        #

        id = localEdge.localId()

        @edges.local[ id ] = 

            local: 

                mode: @context.mode
                globalId: @context.globalId()
                

            remote: connectData

        console.log 'tree', this.edges

        #
        # Send notification rootward
        #

        if @context.mode != 'root'

            @context.uplink.send 'event:edge:connect', @edges.local[ id ]

    insertRemote: (connectData) ->

        id = connectData.local.globalId

        @edges.remote[ id ] = connectData

        console.log 'tree', this.edges

        if @context.mode != 'root'

            @context.uplink.send 'event:edge:connect', @edges.remote[ id ]


    removeLocal: (localEdge) -> 

        id = localEdge.localId()

        @edges.local[ id ].disconnected = new Date()

        if @context.mode != 'root'

            @context.uplink.send 'event:edge:disconnect', @edges.local[ id ]


    removeRemote: (disconnectData) -> 

        id = disconnectData.local.globalId

        @edges.remote[ id ] = disconnectData

        console.log '\n\n\ntree', this.edges

        if @context.mode != 'root'

            @context.uplink.send 'event:edge:disconnect', @edges.remote[ id ]



module.exports = Tree
