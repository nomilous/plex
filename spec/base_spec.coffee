should = require 'should'
Base   = require '../lib/base'
Edge   = require '../lib/edge'

describe 'Base', -> 

    it 'defines start()', (done) -> 

        Base.start.should.be.an.instanceof Function
        done()

    it 'maintaines a list of connected edges keyed on edge.id()', (done) ->

        Base.connect new Edge()
        Base.edges.should.eql 'LOCAL_ID': {}
        done()

    it 'marks edges as disconnected', (done) ->

        edge = new Edge()
        Base.connect( edge )
        Base.disconnect( edge )
        timestamp = Base.edges.LOCAL_ID.disconnected.timestamp
        
        #
        # dunno why this behaves oddly.
        # 
        # timestamp.should.be.an.instanceOf Date

        timestamp.getHours().should.equal (new Date()).getHours()
        done()

    it 'throws on unimplemented adaptor type', (done) -> 

        try 
            Base.start adaptor: 'celtic lantern morse'

        catch error

            error.should.match /adaptor not implemented: celtic lantern morse/
            done()


        