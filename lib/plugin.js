// Generated by CoffeeScript 1.4.0
var i;

i = require('inflection');

module.exports = {
  load: function(defn) {
    var name, plural, type;
    if (!defn.name) {
      throw "plugin.load requires name:'name'";
    }
    if (!defn.type) {
      throw "plugin.load requires type:'type'";
    }
    name = defn.name;
    type = defn.type;
    plural = i.pluralize(type);
    return require("./" + plural + "/" + name + "-" + type);
  }
};