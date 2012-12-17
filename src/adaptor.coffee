module.exports = 

    #
    # Loads and returns an instance of the Adaptor 
    # plugin specified in `opts.listen.adaptor`
    # 

    listen: ( opts ) -> 

        klass = (require './plugin').load

            type: 'adaptor'
            name: opts.listen.adaptor

        return new klass opts
