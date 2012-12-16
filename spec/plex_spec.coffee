should = require 'should'
plex   = require '../lib/plex'

describe 'plex', -> 

    it 'throws if opts.mode is undefined', (done) -> 

        try 
            plex.start {}

        catch error
        
            error.should.match /plex requires mode/
            done()

    it 'throws if opts.adaptor is undefined', (done) -> 

        try 
            plex.start
                mode: 'root'

        catch error

            error.should.match /plex requires adaptor/
            done()

    it 'throws if opts.port is undefined', (done) ->

        try 
            plex.start
                mode: 'root'
                adaptor: 'socket.io'

        catch error

            error.should.match /requires opts.port/
            done()

