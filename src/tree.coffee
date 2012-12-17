
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


        
module.exports = Tree
