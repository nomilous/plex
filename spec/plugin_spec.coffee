should = require 'should'
plugin = require '../lib/plugin'


describe 'plugin', -> 

    it 'throws if name does not exist', (done) ->

        try 
            plugin.load {}

        catch error

            error.should.match /requires name\:'name'/
            done()

    it 'throws if the plugin was not found', (done) ->

        try
            plugin.load 
                type: 'thing'
                name: 'my'

        catch error

            error.should.match /Cannot find module '\.\/things\/my\-thing'/ 
            done()

