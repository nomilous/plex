Node = require './node'

#
# Start a Proxy node
#

module.exports = 

    start : (opts) -> 

        return (new Node).start opts


