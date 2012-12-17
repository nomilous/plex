// Generated by CoffeeScript 1.4.0
var BaseEdge, os;

os = require('os');

BaseEdge = (function() {

  function BaseEdge(connection, opts) {
    this.connection = connection;
    this.opts = opts != null ? opts : {};
    if (this.connection) {
      this.connection._edge = this;
    }
  }

  BaseEdge.prototype.connect = function(onConnect) {
    var connectedThing;
    connectedThing = {
      id: 'LOCAL_ID'
    };
    this.connection = connectedThing;
    this.handshake();
    if (onConnect instanceof Function) {
      return onConnect(this);
    }
  };

  BaseEdge.prototype.handshake = function() {
    return this.send('event:connect', {
      type: this.opts.mode,
      globalId: this.globalId()
    });
  };

  BaseEdge.prototype.send = function(event, payload) {
    return this.sentAmessage = {
      event: event,
      payload: payload
    };
  };

  BaseEdge.prototype.localId = function() {
    if (!this.connection) {
      return 'LOCAL_ID';
    }
    return this.connection.id;
  };

  BaseEdge.prototype.globalId = function() {
    return os.hostname() + '%' + process.pid;
  };

  return BaseEdge;

})();

module.exports = BaseEdge;