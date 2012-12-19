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

        it 'sends handshake', (done) ->

            sent = 1
            edge = new Edge

            context = 
                mode: 'leaf'

            connection = 
                emit: (event, payload) ->
                    sent =
                        event: event
                        payload: payload

            edge.assign context, connection
                

            sent.should.eql 
                event: 'event:connect'
                payload:  
                    mode: 'leaf'
                    globalId: @globalid


            done()


    describe 'connect()', ->

        edge = undefined
        sent = 1
        context = 
            mode: 'leaf'
            connect:
                adaptor: 'base'
                mockConnection: 
                    id: 'MOCK_ID'
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
                    globalId: @globalid

            done()


    it 'defines localId()', (done) -> 

        edge = new Edge
        context = {}
        connection = 
            id: 'LOCAL_ID'
            emit: ->

        edge.assign context, connection 
        edge.localId().should.equal 'LOCAL_ID'
        done()

    
    it 'defaults globalId() to hostname%pid', (done) ->

        edge = new Edge
        edge.globalId().should.equal @globalid
        done() 

