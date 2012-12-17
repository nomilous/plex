
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
        # `tree.edges` houses the list of adjacent Nodes
        # in the branch rooted at this Node
        #

        @edges = {}


    #
    # `tree.insert()` **a new edge into the tree**
    #
    # **localEdge** - expects the [Edge](edge.html) that represents
    # the localside of the connection.
    # 
    # **connectData** - expects the payload of the **event:connect** 
    # message that was sent by the remote side at handshake
    # 

    insert: (localEdge, connectData) -> 

        #
        # Create a record of the edge
        #

        id = localEdge.localId()

        @edges[ id ] = 

            local: 

                globalId: localEdge.globalId()
                mode: @context.mode

            remote: connectData

        #
        # Send notification rootward
        #

        @context.uplink.send 'event:edge:connect', @edges[ id ]

        
module.exports = Tree
