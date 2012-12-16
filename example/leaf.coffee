plex = require '../lib/plex'

plex.start

    mode: 'leaf'
    connect:

        #
        # establish connection to outer_proxy
        #

        adaptor: 'socket.io'
        uri: 'http://localhost:3002'
        onConnect: (edge) -> 

            console.log "LEAF connected with id %s", edge.localId()

