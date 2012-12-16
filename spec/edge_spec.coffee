should = require 'should'
Edge   = require '../lib/edge'
os     = require 'os'

describe 'Edge', ->

    it 'has defines localId()', (done) -> 

        edge = new Edge()
        edge.localId().should.equal 'LOCAL_ID'
        done()

    it 'can be initialized with a connected interface', (done) ->

        edge = new Edge {id: 'ASSIGNED_OBJECT"s_ID' }
        edge.localId().should.equal 'ASSIGNED_OBJECT"s_ID'
        done()
    
    it 'defaults globalId() to hostname%pid', (done) ->

        hostname = os.hostname()
        pid = process.pid

        edge = new Edge()
        edge.globalId().should.equal "#{ hostname }%#{ pid }" 
        done() 
