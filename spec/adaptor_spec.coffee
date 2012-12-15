should  = require 'should'
Adaptor = require '../lib/adaptor'

describe 'Adaptor', -> 

    it 'defines listen() as a class method', (done) -> 

        Adaptor.listen.should.be.an.instanceof Function
        done()
