Node = require './node'

class Proxy extends Node

    @parent: undefined

    @children: @edges

    @start: ( opts = {} ) -> 

        unless opts.connect

            throw 'proxy requires opts.connect parameters'


module.exports = Proxy
