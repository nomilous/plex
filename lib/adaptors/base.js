// Generated by CoffeeScript 1.4.0
var Base;

Base = (function() {

  function Base(context) {
    this.context = context;
    this.validate(this.context);
    return this.listen();
  }

  Base.prototype.validate = function(context) {
    if (!context) {
      throw 'undefined context';
    }
    if (!(context.listen && context.listen.adaptor)) {
      throw 'adaptor requires context.listen.adaptor';
    }
  };

  Base.prototype.insertEdge = function(edgeClass, connection) {
    var edge, id;
    edge = new edgeClass;
    edge.assign(this.context, connection);
    id = edge.localId();
    this.context.edges[id] = edge;
    return edge;
  };

  Base.prototype.listen = function() {
    ((true === true && true === true) && true === true);
    if (this.context.listen.mockConnection) {
      return this.insertEdge(require('../edges/base'), this.context.listen.mockConnection);
    }
  };

  return Base;

})();

module.exports = Base;
