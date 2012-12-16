plex = 

    supportedAdaptors: 'socket.io'

    start: ( opts = {} ) -> 

        unless opts.mode
            throw "plex requires mode: 'root|mux|leaf'" 

        unless opts.adaptor
            throw "plex requires adaptor: '#{ plex.supportedAdaptors }'" 


        if opts.mode == 'root' and opts.adaptor == 'socket.io'

            unless opts.port
            
                throw 'plex root with socket.io requires opts.port'

        server = require "./#{  opts.mode  }"

        server.start opts


module.exports = plex
