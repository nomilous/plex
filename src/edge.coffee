class Edge

    #
    # Base class / interface for an edge
    # 
    # - Represents a connection to another node
    # 
    # - Defines the abstraction necessary to
    #   support multiple transport types in
    #   the proxy tree.
    # 


    # 
    #  connected - Contains the connection object
    #              to be wrapped into the edge 
    #              interface. 
    #             
    #  opts      - If connected is null the opts
    #              are used to connect a new Bdge.
    # 
    # 
    
    constructor: (@connected, opts = {}) ->


    #
    # edge defines localId()
    # 
    # - MUST be unique among all 
    #   locally attached edges 
    #

    localId: -> 'LOCAL_ID'


module.exports = Edge
