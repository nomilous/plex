should = require 'should'
root   = require '../lib/root'
proxy  = require '../lib/proxy'
leaf   = require '../lib/leaf'

describe 'leaf', -> 

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
            port: rootPort
        listen:
            adaptor: adaptor
            port: proxyPort



    before (done) ->

        root.start rootConfig
        done()


    it 'can connect to root', (done) -> 

        leaf.start
            mode: 'leaf'
            connect:
                adaptor: adaptor
                uri: "http://localhost#{ rootPort }"



        done()

    