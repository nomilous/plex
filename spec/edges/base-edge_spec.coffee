should = require 'should'
Edge   = require '../../lib/edges/base-edge'
os     = require 'os'

describe 'Edge', ->

    before (done) ->

        @globalid = os.hostname() + '%' + process.pid
        done()

    it 'throws on undefined context', (done) -> 

        try
            (new Edge).connect()

        catch error

            error.should.equal 'undefined context'
            done()

    it 'throws on undefined connect.adaptor', (done) ->

        try
            edge = new Edge
            edge.connect 
                connect: {}

        catch error

            error.should.equal 'edge requires connect.adaptor'
            done()


    it 'defines send()', (done) ->

        edge = new Edge
        edge.send.should.be.an.instanceof Function
        done()

    it 'defines handshake()', (done) ->

        edge = new Edge
        edge.handshake.should.be.an.instanceof Function
        done()

    describe 'assign()', -> 

        it 'pending'


    describe 'connect()', ->

        edge = undefined
        sent = 1
        context = 
            mode: 'leaf'
            globalId: -> 'GLOBAL_ID'
            connect:
                adaptor: 'base'
                mockConnection: 
                    id: 'MOCK_ID'
                    on: ->
                    emit: (event, payload) => 
                        sent =
                            event: event
                            payload: payload

        beforeEach (done) -> 

            edge = new Edge
            edge.connect context
            done()


        it 'uses config in connect.adaptor', (done) -> 

            edge.connection.id.should.equal 'MOCK_ID'
            done()


        it 'sends a handshake on connect', (done) ->

            sent.should.eql 
                event: 'event:connect'
                payload: 
                    mode: 'leaf', 
                    globalId: 'GLOBAL_ID'

            done()


    it 'defines localId()', (done) -> 

        edge = new Edge
        context = 
            globalId: -> 'GLOBAL_ID'
        connection = 
            id: 'LOCAL_ID'
            on: ->
            emit: ->

        edge.assign context, connection 
        edge.localId().should.equal 'LOCAL_ID'
        done()

    it 'defines getSubscriber() to get the event subscriber from the underlying transport', (done) -> 

        edge = 
        subscribed = {}
          
        subscribeFn = (event, callback) ->

            subscribed[event] = callback

        publishFn = (event, payload) ->

            'mock publish function' 

        underlyingTransport =

            #
            # like socket.io
            # subscriber is `socket.on( event, function( payload ) { } )`
            # publisher is `socket.emit( event, payload )`
            #

            on: subscribeFn
            emit: publishFn

        
        edge = (new Edge).assign context, underlyingTransport

        myCallback = (payload) -> 
            'i want EVENT events'

        subscribe = edge.getSubscriber()

        subscribe 'EVENT', myCallback

        subscribed.EVENT.should.equal myCallback

        done()


    it 'callback for a user configurable protocol providing subscribe() and publish() methods to implement', (done) -> 

        edge = new Edge

        mockConnection = on: ->

        context = new (require '../../lib/context')

            mode: 'proxy'
            listen: 
                adaptor: 'base'


            protocol: (receive, send) -> 

                # eg.

                receive 'start', -> send 'myEVENT', 'hello'

                receive 'myEventReply', (payload) ->  payload == 'hello you too'
                   

                receive.should.be.an.instanceof Function
                send.should.be.an.instanceof Function
                done()


        edge.assign context, mockConnection

        


            
