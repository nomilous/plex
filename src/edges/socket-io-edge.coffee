Edge = require '../edge'

class SocketIoEdge extends Edge

    constructor: (@socket) -> 

    localId: -> @socket.id


module.exports = SocketIoEdge
