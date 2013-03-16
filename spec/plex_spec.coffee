should = require 'should'
plex   = require '../lib/plex'

describe 'plex', -> 

    it 'throws if neither opts.listen or opts.connect is defined', (done) -> 

        try 
            plex.start {}

        catch error
        
            error.should.match /plex requires opts.connect and\|or opts.listen/
            done()

    it 'throws if opts.listen.adaptor is undefined', (done) -> 

        try 
            plex.start
                listen: {}

        catch error

            error.should.match /plex requires opts.listen.adaptor/
            done()


    describe 'determines mode from opts', ->

        it 'is root if only connect', (done) ->

            context = plex.start
                listen: 
                    adaptor: 'socket.io'
                    port: 12343

            context.mode.should.equal 'root'
            done()

        it 'is proxy if both connect and listen', (done) ->

            context = plex.start
                listen: 
                    adaptor: 'socket.io'
                    port: 12344
                connect: 
                    adaptor: 'socket.io'
                    uri: 'http://k'

            context.mode.should.equal 'proxy'
            done()

        it 'is leaf if only connect', (done) ->

            context = plex.start
                connect: 
                    adaptor: 'socket.io'
                    uri: 'http://k'

            context.mode.should.equal 'leaf'
            done()
