should   = require 'should'
adaptors = require '../lib/adaptors'

describe 'adaptors', -> 

    it '.listen() returns a listening adaptor', (done) -> 

        adaptors.listen(

            listen:
                adaptor: 'example'

        ).should.eql 

            listening: true 

        done()
