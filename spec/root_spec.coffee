should = require 'should'
root   = require '../lib/root'
proxy  = require '../lib/proxy'

describe 'root', -> 

    it 'defines start()', (done) -> 

        root.start.should.be.an.instanceof Function
        done()

    xit 'listens according to opts.listen', (done) ->

        root.start
            listen: 
                adaptor: 'socket.io'
                port: 3004
                onListen: (adaptor) =>

                    console.log 'on listen'

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
                            uri: 'http://localhost:3004'
                            onConnect: (clientEdge) -> 

                                done()

                        listen:
                            adaptor: 'socket.io'
                            port: 3005
                                


                onConnect: (serverEdge) ->

        