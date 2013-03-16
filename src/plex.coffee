Node = require './node'
opts = require './opts'

plex = 

    #
    # questionable as necessary?:
    supportedAdaptors: 'socket.io'


    #
    # **class** `plex.Node` 
    #
    # * Returns the [Node](node.html) class for extension
    # * Constructor should assemble [opts](opts.html) 
    #
    # #### *Usage*
    #
    # <pre>
    # plex = require 'plex'
    #
    # class MyNode extends plex.Node
    #   
    #     constructor: (args) ->
    # 
    #         #
    #         # assemble @opts from args
    #         #
    #
    # node = new MyNode { my: 'args' }
    # plex.start node
    #
    # </pre>
    #

    Node: Node


    #
    # **literal** `plex.opts`
    # 
    # * Returns [opts](opts.html) object literal
    # 
    # 

    opts: opts


    start: ( opts = {} ) -> 

        plex.opts.validate opts

        if opts.listen

            if opts.connect

                opts.mode = 'proxy'
        
            else

                opts.mode = 'root'


         if opts.connect and not opts.mode

            opts.mode = 'leaf'


        return (new Node).start opts


module.exports = plex