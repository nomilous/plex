Node = require './node'
opts = require './opts'

plex = 

    #
    # **function** `plex.start` 
    #
    # * Starts the server
    #
    # *Usage*
    #
    # <pre>
    # plex = require 'plex'
    #
    # plex.start
    # 
    #    secret: 'SEEKRIT'
    # 
    #    connect:
    #       adaptor: 'socket.io'
    #       uri: 'http://rootward.proxy:3000'
    # 
    #    listen:
    #       # listen for leaves/childProxies
    #       adaptor: 'socket.io'
    #       port: 12340
    #    
    # </pre>
    #

    
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


    #
    # questionable as necessary?:
    supportedAdaptors: 'socket.io'


    #
    # **class** `plex.Node` 
    #
    # * Returns the [Node](node.html) class for extension
    # * Constructor should assemble [opts](opts.html) 
    #
    #
    # *Usage*
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



module.exports = plex