should = require 'should'
root   = require '../lib/root'
proxy  = require '../lib/proxy'
leaf   = require '../lib/leaf'

rootPort  = 6000
proxyPort = 6001
adaptor   = 'socket.io'

rootConfig = 
    mode: 'root'
    listen:
        adaptor: adaptor
        port: rootPort

proxyConfig =
    mode: 'proxy'
    connect: 
        adaptor: adaptor
        uri: "http://localhost:#{ rootPort }"
    listen:
        adaptor: adaptor
        port: proxyPort


describe 'leaf', -> 

    before (done) ->

        root.start rootConfig
        proxy.start proxyConfig
        done()

    it 'can connect to root', (done) -> 

        leaf.start
            mode: 'leaf'
            connect:
                adaptor: adaptor
                uri: "http://localhost:#{ rootPort }"
                onConnect: (edge) -> 
                    done()

    it 'can connect to proxy', (done) -> 

        leaf.start
            mode: 'leaf'
            connect:
                adaptor: adaptor
                uri: "http://localhost:#{ proxyPort }"
                onConnect: (edge) -> 
                    done()
