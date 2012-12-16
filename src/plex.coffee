plex = 

    supportedAdaptors: 'socket.io'

    start: ( opts = {} ) -> 

        unless opts.mode
            throw "plex requires mode: 'root|proxy|leaf'" 

        unless opts.adaptor
            throw "plex requires adaptor: '#{ plex.supportedAdaptors }'" 


        if opts.adaptor == 'socket.io'

            if opts.mode == 'root' or opts.mode == 'proxy'

                unless opts.port
                
                    throw 'plex root|proxy with socket.io requires opts.port'

        server = require "./#{  opts.mode  }"

        server.start opts


module.exports = plex
