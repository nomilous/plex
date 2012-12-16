Node = require './node'

class Proxy extends Node

    @start: ( opts = {} ) -> 

        unless opts.connect and opts.connect.adaptor

            throw 'proxy requires opts.connect.adaptor parameters'


        unless opts.listen and opts.listen.adaptor

            throw 'proxy requires opts.listen.adaptor parameters'


        #
        # start connect (parent)
        #

        @connect opts


        #
        # start listen (children)
        #

        @listen opts


module.exports = Proxy
