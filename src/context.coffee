#
# Context carries reference to all the necessary
# components for [Plex](plex.html) to function.
#


module.exports = class Context

    constructor: ( opts = {} ) -> 

        for property of opts

            #
            # All configured properties are loaded 
            # into the Context instance.
            #

            @[property] = opts[property]

        #
        # A reference to the [Tree](tree.html)
        #
    
        @tree = new (require './tree')

