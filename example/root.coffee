plex = require '../lib/plex'

plex.start

    mode: 'root'
    listen:
        adaptor: 'socket.io'
        port: 3000
        onListen: (adaptor) ->


            console.log "ROOT listening:", adaptor
        

        onConnect: (edge) ->
            

            console.log "ROOT got connection with id = %s", edge.localId()
