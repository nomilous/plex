module.exports = opts = 

    #
    # **function** `opts.validate`
    #

    validate: (config) -> 

        unless config.listen or config.connect

            throw 'plex requires opts.connect and|or opts.listen'

        for edge in ['connect', 'listen']

            if config[edge]

                unless config[edge].adaptor

                    throw "plex requires opts.#{ edge }.adaptor"

