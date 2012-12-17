module.exports = 

    connect: ( opts ) -> 

        klass = (require './plugin').load

            type: 'edge'
            name: opts.connect.adaptor

        return new klass opts
