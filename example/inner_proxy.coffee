plex = require '../lib/plex'

plex.start

    mode: 'proxy'
    connect:

        #
        # establish connection to root
        #

        adaptor: 'socket.io'
        uri: 'http://localhost:3000'
        onConnect: (edge) -> 

            console.log "PROXY connected with id %s", edge.localId()


    listen:

        #
        # and listen for child nodes
        #

        adaptor: 'socket.io'
        port: 3001


    protocol: (receive, send) -> 

        console.log "configure protocol"

        receive 'connect', -> 

            console.log 'CONNECT'
