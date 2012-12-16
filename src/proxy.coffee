Node = require './node'

class Proxy extends Node

    @parent: undefined

    @children: @edges

    @start: ( opts = {} ) -> 

        unless opts.connect and opts.connect.adaptor

            throw 'proxy requires opts.connect.adaptor parameters'

        ParentEdgeClass = require "./edges/#{  opts.connect.adaptor  }-edge"

        @parent = new ParentEdgeClass null, opts

        @parent.connect =>

            if opts.connect.callback

                opts.connect.callback this

            console.log "PROXY connected", localId: @parent.localId()


module.exports = Proxy
