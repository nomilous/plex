should  = require 'should'
BaseAdaptor = require '../../lib/adaptors/base-adaptor'

describe 'Adaptor', -> 


    it 'throws if context is undefined', (done) -> 

        try
            adaptor = new BaseAdaptor
            adaptor.validate()

        catch error

            error.should.match /undefined context/
            done()

    it 'throws if context.listen.adaptor is undefined', (done) -> 

        try
            adaptor = new BaseAdaptor
            adaptor.validate 
                listen:
                    toMusic:
                        artist:    'Raimonds Tiguls'
                        album:     'Četri vēji'
                        track:     'Kū es biju sarēbusi'

                        seriously: 'its a masterpiece'

        catch error

            error.should.match /adaptor requires context\.listen\.adaptor/
            done()
