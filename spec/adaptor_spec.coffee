should  = require 'should'
Adaptor = require '../lib/adaptor'

describe 'Adaptor', -> 

    it 'defines listen() as a class method', (done) -> 

        Adaptor.listen.should.be.an.instanceof Function
        done()


    it 'throws if opts is undefined', (done) -> 

        try
            Adaptor.listen()

        catch error

            error.should.match /undefined opts/
            done()


    it 'throws if callback onConnect(newEdge) is undefined', (done) ->

        try
            Adaptor.listen {}

        catch error

            error.should.match /undefined onConnect/
            done()

    it 'throws if callback signature does not have 1 arg', (done) ->

        try 
            Adaptor.listen {}, -> 

                # 
                # no args for this callback
                # 

        catch error

            error.should.match /with 1 arg/
            done()

    it 'calls back when a new edge connects', (done) -> 

        Adaptor.listen {}, (newEdge) -> 

            newEdge.localId().should.equal 'LOCAL_ID'
            done()
