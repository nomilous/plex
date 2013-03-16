Node = require './node'

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
    # **Usage**
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

    start: ( opts = {} ) -> 

        unless opts.listen or opts.connect

            throw 'plex requires opts.connect and|or opts.listen'

        for edge in ['connect', 'listen']

            if opts[edge]

                unless opts[edge].adaptor

                    throw "plex requires opts.#{ edge }.adaptor"

        if opts.listen

            if opts.connect

                opts.mode = 'proxy'
        
            else

                opts.mode = 'root'


         if opts.connect and not opts.mode

            opts.mode = 'leaf'


        return (new Node).start opts


module.exports = plex