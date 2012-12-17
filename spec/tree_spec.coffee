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


    describe 'manages the list of connected edges:', ->

        beforeEach (done) ->

            @sent = undefined

            context = 
                mode: 'proxy'


            @tree = new Tree context

            @localEdge = 
                localId: -> 'localid'
                globalId: -> 'GID'
            
            done()



        describe 'insert(edge, connectData)', ->

            it 'adds an edge to the tree', (done) -> 

                @tree.insert @localEdge,

                    #
                    # remote edge event:connect payload
                    #

                    mode: 'leaf'
                    globalId: 'remote_host:pid'

                @tree.edges.localid.local.mode.should.equal 'proxy'
                @tree.edges.localid.local.globalId.should.equal 'GID'
                @tree.edges.localid.remote.mode.should.equal 'leaf'
                @tree.edges.localid.remote.globalId.should.equal 'remote_host:pid'
                done()


        describe 'remove(edge)', -> 

            it 'marks an edge as disconnected'

        describe 'has access to uplink SO THAT', ->

            #
            # SO THAT - there's something that could 
            #           further enable TDD  
            # 

            it 'can inform rootward of edges connectng'

            it 'can inform rootward of edges disconnecting'

