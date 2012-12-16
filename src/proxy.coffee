Node = require './node'

class Proxy extends Node

    @parent: undefined

    @children: @edges

    @start: ( opts = {} ) -> 

        unless opts.connect and opts.connect.adaptor

            throw 'proxy requires opts.connect.adaptor parameters'


        unless opts.listen and opts.listen.adaptor

            throw 'proxy requires opts.listen.adaptor parameters'


        #
        # start connect (parent)
        #

        ParentEdgeClass = require "./edges/#{  opts.connect.adaptor  }-edge"

        @parent = new ParentEdgeClass null, opts

        @parent.connect =>

            if opts.connect.onConnect

                opts.connect.onConnect @parent


        #
        # start listen (children)
        #

        @listen opts




module.exports = Proxy
