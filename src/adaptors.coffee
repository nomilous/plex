module.exports = 

    listen: ( opts ) -> 

        klass = (require './plugin').load

            type: 'adaptor'
            name: opts.listen.adaptor

        return new klass opts
