Adaptor = require '../adaptor'

class SocketIoAdaptor

    @listen: ( opts, onConnect ) ->

        Adaptor.validate opts, onConnect

        throw 'undefined opts.port' unless opts.port



module.exports = SocketIoAdaptor
