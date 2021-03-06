// Generated by CoffeeScript 1.4.0
var opts;

module.exports = opts = {
  validate: function(config) {
    var edge, _i, _len, _ref, _results;
    if (!(config.listen || config.connect)) {
      throw 'plex requires opts.connect and|or opts.listen';
    }
    _ref = ['connect', 'listen'];
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      edge = _ref[_i];
      if (config[edge]) {
        if (!config[edge].adaptor) {
          throw "plex requires opts." + edge + ".adaptor";
        } else {
          _results.push(void 0);
        }
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  }
};
