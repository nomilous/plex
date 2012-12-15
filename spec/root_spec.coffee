should = require 'should'
root   = require '../lib/root'

describe 'root', ->

    it 'defines start()', (done) -> 

        root.start.should.be.an.instanceof Function
        done()
