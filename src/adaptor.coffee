module.exports = 

    #
    # Loads and returns an instance of the Adaptor 
    # plugin specified in `opts.listen.adaptor`
    # 

    listen: ( context ) -> 

        klass = (require './plugin').load

            type: 'adaptor'
            name: context.listen.adaptor

        return new klass context
