should = require 'should'
root   = require '../lib/root'
proxy  = require '../lib/proxy'
Edge   = require '../lib/edge'

describe 'root', -> 

    it 'is identical to Base', (done) ->

        done()


    it 'defines start()', (done) -> 

        root.start.should.be.an.instanceof Function
        done()

    it 'listens according to opts.listen', (done) ->

        root.start
            listen: 
                adaptor: 'socket.io'
                port: 3000
                onListen: (adaptor) =>

                    #
                    # integration testing root by attaching
                    # a proxy to it... 
                    # 
                    # downside: it could fail because of the 
                    # proxy code and node the root code
                    #

                    proxy.start
                        connect:
                            adaptor: 'socket.io'
                            uri: 'http://localhost:3000'
                            onConnect: (clientEdge) -> 

                                done()
                                


                onConnect: (serverEdge) ->
