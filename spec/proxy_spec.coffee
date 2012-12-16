should = require 'should'
proxy  = require '../lib/proxy'
Edge   = require '../lib/edge'

describe 'proxy', -> 

    it 'defines start()', (done) -> 

        proxy.start.should.be.an.instanceof Function
        done()

    it 'throws on missing opts.connect', -> 

        try 
            proxy.start {}

        catch error

            error.should.equal 'proxy requires opts.connect parameters'

