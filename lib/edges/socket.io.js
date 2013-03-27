// Generated by CoffeeScript 1.4.0
var Base, SocketIo, ioClient,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Base = require('./base');

ioClient = require('socket.io-client');

module.exports = SocketIo = (function(_super) {

  __extends(SocketIo, _super);

  function SocketIo() {
    return SocketIo.__super__.constructor.apply(this, arguments);
  }

  SocketIo.prototype.connect = function(context) {
    this.context = context;
    if (!(this.context.connect && this.context.connect.uri)) {
      throw 'SocketIoEdge requires connect.uri';
    }
    this.connection = ioClient.connect(this.context.connect.uri);
    this.localId = function() {
      return this.connection.socket.sessionid;
    };
    this.assign(this.context, this.connection);
    return this;
  };

  return SocketIo;

})(Base);