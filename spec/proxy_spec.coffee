should = require 'should'
proxy  = require '../lib/proxy'
Edge   = require '../lib/edge'

describe 'proxy', -> 

    
    it 'is identical to Base', (done) ->

        done()


    it 'defines start()', (done) -> 

        proxy.start.should.be.an.instanceof Function
        done()

