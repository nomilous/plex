should = require 'should'
root   = require '../lib/root'
Edge   = require '../lib/edge'

describe 'root', -> 

    it 'is identical to Base', (done) ->

        done()


    it 'defines start()', (done) -> 

        root.start.should.be.an.instanceof Function
        done()
