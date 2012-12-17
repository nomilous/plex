module.exports = 
    
    #
    # Loads and returns an instance of the Edge 
    # plugin specified in `opts.connect.adaptor`
    # 

    connect: ( opts ) -> 

        klass = (require './plugin').load

            type: 'edge'
            name: opts.connect.adaptor

        return new klass opts
