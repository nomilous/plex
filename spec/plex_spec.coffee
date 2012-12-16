should = require 'should'
plex   = require '../lib/plex'

describe 'plex', -> 

    it 'throws if opts.mode is undefined', (done) -> 

        try 
            plex.start {}

        catch error
        
            error.should.match /plex requires mode/
            done()

    it 'throws if opts.listen.adaptor is undefined', (done) -> 

        try 
            plex.start
                mode: 'root'

        catch error

            error.should.match /plex requires listen.adaptor/
            done()
