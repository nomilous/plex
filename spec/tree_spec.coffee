should = require 'should'
Tree   = require '../lib/tree'

describe 'Tree', ->

    it 'is constructed with Context', (done) ->

        context = 
            data: 'DATA'
        tree = new Tree context
        tree.context.should.equal context
        done()

    it 'houses the collection of edges in the tree', (done) -> 

        tree = new Tree { con: 'TEXT' }
        tree.edges.should.eql {}
        done()




    describe '.insert(edgeData)', ->

        it 'adds an edge to the tree'

    describe '.remove(edgeData)', -> 

        it 'marks an edge as disconnected'

    describe 'has access to uplink SO THAT', ->

        #
        # SO THAT - there's something that could 
        #           further enable TDD  
        # 

        it 'can inform rootward of edges connectng'

        it 'can inform rootward of edges disconnecting'

