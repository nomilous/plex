plex = 

    supportedAdaptors: 'socket.io'

    start: ( opts = {} ) -> 

        unless opts.mode
            throw "plex requires mode: 'root|proxy|leaf'" 

        unless opts.mode == 'leaf'

            unless opts.listen and opts.listen.adaptor
                throw "plex requires listen.adaptor: '#{ plex.supportedAdaptors }'" 


            if opts.listen.adaptor == 'socket.io'

                if opts.mode == 'root' or opts.mode == 'proxy'

                    unless opts.listen.port or opts.listen.app
                    
                        throw 'plex root|proxy with socket.io requires opts.listen.port or opts.listen.app'

        server = require "./#{  opts.mode  }"

        server.start opts


module.exports = plex
