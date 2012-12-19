should = require 'should'
Tree   = require '../lib/tree'

tree = undefined
sent = undefined

describe 'Tree', ->

    it 'is constructed with Context', (done) ->

        context = 
            data: 'DATA'
        tree = new Tree context
        tree.context.should.equal context
        done()

    it 'houses the collection of edges in the tree', (done) -> 

        tree = new Tree { con: 'TEXT' }
        tree.edges.should.eql { local: {}, remote: {}}
        done()


    describe 'manages the list of connected edges:', ->

        beforeEach (done) ->

            context = 
                mode: 'proxy'
                globalId: -> 'GID'
                uplink:
                    send: (event, payload) -> 
                        sent = 
                            event: event
                            payload: payload


            tree = new Tree context

            @localEdge = 
                localId: -> 'localid'
            
            done()



        describe 'insertLocal(edge, connectData)', ->


            it 'adds a local edge to the tree', (done) -> 

                tree.insertLocal @localEdge,

                    #
                    # remote edge event:connect payload
                    #

                    mode: 'leaf'
                    globalId: 'remote_host:pid'

                tree.edges.local.localid.local.mode.should.equal 'proxy'
                tree.edges.local.localid.local.globalId.should.equal 'GID'
                tree.edges.local.localid.remote.mode.should.equal 'leaf'
                tree.edges.local.localid.remote.globalId.should.equal 'remote_host:pid'
                done()


            it "sends an 'event:node:connect' rootward", (done) -> 

                tree.insertLocal @localEdge,

                    mode: 'leaf'
                    globalId: 'remote_host:pid'


                sent.should.eql 

                    event: 'event:edge:connect'
                    payload: 
                        local: 
                            mode: 'proxy'
                            globalId: 'GID'
                        remote:
                            mode: 'leaf'
                            globalId: 'remote_host:pid'

                done()



            describe 'insertRemote()', -> 

                it 'adds a remote edge', (done) -> 

                    tree.insertRemote
                        local: # nearest side of the remote edge
                            mode: 'proxy'
                            globalId: 'REMOTE_GLOBAL_ID'
                        remote:
                            mode: 'leaf'
                            globalId: 'remote_host:pid'

                    tree.edges.remote.REMOTE_GLOBAL_ID.local.globalId.should.equal 'REMOTE_GLOBAL_ID'

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

