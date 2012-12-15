should          = require 'should'
SocketIoAdaptor = require '../../lib/adaptors/socket-io-adaptor'

describe 'SocketIoAdaptor', ->


    it 'throws if opts.port is undefined', (done) ->

        try 
            SocketIoAdaptor.listen {}, (newEdge) ->

        catch error

            error.should.equal 'undefined opts.port'
            done()


    xit 'listens', (done) -> 

        