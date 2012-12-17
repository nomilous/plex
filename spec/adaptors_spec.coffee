should   = require 'should'
adaptors = require '../lib/adaptors'

describe 'adaptors', -> 

    it '.listen() returns a listening adaptor', (done) -> 

        adaptors.listen().should.equal 'adaptor'
        done()
