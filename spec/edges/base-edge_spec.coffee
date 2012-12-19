should = require 'should'
Edge   = require '../../lib/edges/base-edge'
os     = require 'os'

describe 'Edge', ->

    before (done) ->

        @globalid = os.hostname() + '%' + process.pid
        done()

    it 'throws on undefined context', (done) -> 

        try
            edge = new Edge

        catch error

            error.should.equal 'undefined context'
            done()

    it 'throws on undefined connect.adaptor', (done) ->

        try
            edge = new Edge null, connect: {}

        catch error

            error.should.equal 'edge requires connect.adaptor'
            done()

    it 'does not validate if contructed with an exiting conneciton', (done) ->

        edge = new Edge {}

        #
        # did not throw
        #

        done()


    xit 'has defines localId()', (done) -> 

        edge = new Edge()
        edge.localId().should.equal 'LOCAL_ID'
        done()

    xit 'can be initialized with a connected interface', (done) ->

        edge = new Edge {id: 'ASSIGNED_OBJECT"s_ID' }
        edge.localId().should.equal 'ASSIGNED_OBJECT"s_ID'
        done()
    
    xit 'defaults globalId() to hostname%pid', (done) ->

        edge = new Edge()
        edge.globalId().should.equal @globalid 
        done() 

    xit 'sends registration when connecting as client', (done) -> 

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

    xit 'attaches self to the connection connections', (done) ->

        connection = {}
        edge = new Edge connection, {}
        connection._edge.should.not.be.undefined
        done()
