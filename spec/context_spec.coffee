should = require 'should'
Context = require '../lib/context'

describe 'Context', -> 

    it 'contains the runtime / support context for plex'

    it 'is extended with all config', (done) -> 

        config = thing: 'a'
        context = new Context config
        context.thing.should.equal 'a'

        done()