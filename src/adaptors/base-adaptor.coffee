class Adaptor 

    validate: (context) ->     # , onConnect) -> 

        throw 'undefined context' unless context

        unless context.listen and context.listen.adaptor
            
            throw 'adaptor requires context.listen.adaptor'




        #throw 'undefined onConnect(newEdge) callback' unless onConnect
        #throw 'expected onConnect(newEdge) with 1 arg' unless onConnect.length == 1
    
    # @listen: ( @opts, onConnect ) -> 

    #     @validate @opts, onConnect
        

    #     #
    #     # listen for connecting 'clients'
    #     #

    #     #
    #     # pretend one connected and call-it-back with onConnect(newEdge)
    #     #

    #     newEdge = new (require './edge')  # nice... :) 
    #                                       # 
    #                                       # require keeps impressing me
    #                                       # 
    #     onConnect newEdge


module.exports = Adaptor
