Node = require './node'

class Leaf extends Node

    @start: ( opts = {} ) -> 

        unless opts.connect and opts.connect.adaptor

            throw 'proxy requires opts.connect.adaptor parameters'

        @connect opts


module.exports = Leaf
