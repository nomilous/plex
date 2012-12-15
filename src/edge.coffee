class Edge

    #
    # base class / interface for an edge
    # 
    
    constructor: (opts = {}) ->

    #
    # edge defines localId()
    # 
    # - MUST be unique among all 
    #   locally attached edges 
    #

    localId: -> 'LOCAL_ID'


module.exports = Edge
