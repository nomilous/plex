should  = require 'should'
BaseAdaptor = require '../../lib/adaptors/base-adaptor'

describe 'Adaptor', -> 


    it 'throws if context is undefined', (done) -> 

        try
            adaptor = new BaseAdaptor

        catch error

            error.should.match /undefined context/
            done()

    it 'throws if context.listen.adaptor is undefined', (done) -> 

        try
            new BaseAdaptor
                listen:
                    toMusic:
                        artist:    'Raimonds Tiguls'
                        album:     'Četri vēji'
                        track:     'Kū es biju sarēbusi'

                        seriously: 'its a masterpiece'

        catch error

            error.should.match /adaptor requires context\.listen\.adaptor/
            done()


    it 'listens', (done) ->

        #
        # override listen()
        #
        itListenend = false

        BaseAdaptor.prototype.listen = -> itListenend = true

        adaptor = new BaseAdaptor 
            listen:
                adaptor: {}

        itListenend.should.equal true

        done()




