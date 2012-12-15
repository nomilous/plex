should          = require 'should'
SocketIoAdaptor = require '../../lib/adaptors/socket-io-adaptor'

describe 'SocketIoAdaptor', ->

    it 'throws if opts.port is undefined', (done) ->

        try 
            SocketIoAdaptor.listen {}, (newEdge) ->

        catch error

            error.should.equal 'undefined opts.port'
            done()


    describe 'listening', -> 

        client  = require 'socket.io-client'
        adaptor = undefined
        port    = 3000

        before (done) ->

            @edge = undefined

            adaptor = SocketIoAdaptor.listen {

                port: port

            }, (newEdge) => 

                @edge = newEdge

            done()


        after ->

            # adaptor.close()


        xit 'calls back with newEdge', (done) -> 

            