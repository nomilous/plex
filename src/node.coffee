#
# Node is the baseclass that represents the
# running [Plex](plex.html) instance.
# 
# It is extended to become one of:
# 
# * [Root](root.html)
# * [Proxy](proxy.html)
# * [Leaf](leaf.html)
#

module.exports = class Node

    constructor: -> 

    #
    # ### Start() a new instance running
    # 
    # This returns the running [Context](context.html)
    #

    start: ( opts = {} ) -> 

        context = new (require './context') opts


        # 
        # **To configure the node to listen**
        # 
        # <pre>
        # context = node.start
        #   listen: 
        #     adaptor: 'name'
        #        # 
        #        # see  ./adaptors/*-adaptor
        #        # 
        # </pre>
        # 

        context.adaptor = @listen opts if opts.listen


        #
        # **To configure the node to connect**
        # 
        # <pre>
        # node.start 
        #   connect: 
        #     adaptor: 'name'
        #        #
        #        # see  ./edges/*-edge
        #        # 
        # </pre>

        context.uplink = @connect opts if opts.connect



        return context


    #
    # ### Private methods.
    #
    # In so far as thats possible.
    # 


    #
    # **listen() using opts.listen.adaptor**
    # 
    # * Starts a listening Adaptor that multiple edges
    #   may attach to
    #
    # * Return the listening Adaptor
    # 

    listen: ( opts ) -> 

        return ( require './adaptor' ).listen opts


    #
    # **connect() using opts.connect.adaptor**
    #
    # * Connects the edge to some remote Adaptor
    # 
    # * Sends a Handshake message
    # 
    # * Returns the connected edge
    # 

    connect: ( opts ) -> 

        return ( require './edge' ).connect opts


module.exports = Node





# class Node

#     #
#     # Maintain a list of 'entities' attached
#     # Each edge represents an attached node
#     #

#     @edges: {}

#     @uplink: undefined


#     @start: (opts = {}) -> 

#         @listen opts


#     @listen: (opts) ->

#         adaptor = opts.listen.adaptor || 'socket.io'
#         port = process.env.PORT || opts.listen.port || 3001
#         opts.edges = @edges 
        
#         switch adaptor

#             when 'socket.io'

#                 @adaptor = require "./adaptors/#{ adaptor }-adaptor"
#                 @adaptor.listen opts, @onConnect

#             else throw "adaptor not implemented: #{adaptor}"


#     @connect: (opts) -> 

#         UplinkClass = require "./edges/#{  opts.connect.adaptor  }-edge"

#         @uplink = new UplinkClass null, opts

#         opts.uplink = @uplink

#         @uplink.connect =>

#             if opts.connect.onConnect

#                 opts.connect.onConnect @uplink


#     @onConnect: (edge) => 

#         #
#         # called when an edge connects
#         #

#         @edges[ edge.localId() ] = edge


#     @onDisconnect: (edge) => 

#         #
#         # called when an edge disconnects
#         # 
#         # - set disconnected time
#         # - reap later, or report
#         # 

#         @edges[ edge.localId() ].disconnected =

#             timestamp: new Date()


# module.exports = Node
