i = require 'inflection'

module.exports = 

    load: ( defn ) ->

        console.log '\nplugin.load() with:', defn

        throw "plugin.load requires name:'name'" unless defn.name
        throw "plugin.load requires type:'type'" unless defn.type

        name   = defn.name
        type   = defn.type
        plural = i.pluralize type

        return require "./#{  plural  }/#{ name }-#{ type }"


