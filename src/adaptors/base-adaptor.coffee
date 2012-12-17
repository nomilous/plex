class Adaptor 

    #
    # EXAMPLE Adaptor (a literal, not a class)
    # 
    # ie. The thing that listens for 'clients'
    #     attempting to attach, as edges, onto
    #     the local node.
    #
    # 
    # Note: This literal demonstrates the 
    #       behaviour that plex expects of
    #       an Adaptor
    #    

    @validate: (opts, onConnect) -> 

        throw 'undefined opts' unless opts
        throw 'undefined onConnect(newEdge) callback' unless onConnect
        throw 'expected onConnect(newEdge) with 1 arg' unless onConnect.length == 1
    
    @listen: ( @opts, onConnect ) -> 

        @validate @opts, onConnect
        

        #
        # listen for connecting 'clients'
        #

        #
        # pretend one connected and call-it-back with onConnect(newEdge)
        #

        newEdge = new (require './edge')  # nice... :) 
                                          # 
                                          # require keeps impressing me
                                          # 
        onConnect newEdge


module.exports = Adaptor
