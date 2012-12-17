should = require 'should'
Edge   = require '../lib/edge'
os     = require 'os'

describe 'Edge', ->

    before (done) ->

        @globalid = os.hostname() + '%' + process.pid
        done()

    it 'has defines localId()', (done) -> 

        edge = new Edge()
        edge.localId().should.equal 'LOCAL_ID'
        done()

    it 'can be initialized with a connected interface', (done) ->

        edge = new Edge {id: 'ASSIGNED_OBJECT"s_ID' }
        edge.localId().should.equal 'ASSIGNED_OBJECT"s_ID'
        done()
    
    it 'defaults globalId() to hostname%pid', (done) ->

        edge = new Edge()
        edge.globalId().should.equal @globalid 
        done() 

    it 'sends registration when connecting as client', (done) -> 

        edge = new Edge null,
            mode: 'proxy'
            connect: {}

        edge.connect()

        edge.sentAmessage.should.eql
            event: 'event:connect'
            payload:
                type: 'proxy'
                globalId: @globalid


        done()

