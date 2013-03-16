i = require 'inflection'

module.exports = plugin =

    #
    # **function** `plugin.load`
    # 
    # * Returns the specified plugin definition
    # * Supports local or npm installed modules as plugins
    # 
    # *Usage (as local plugin)*
    # 
    # 
    # *Usage (as npm plugin)*
    # 
    # 

    load: ( defn ) ->

        #
        # TODO: local plugins
        #    
        #    name becomes 'category'
        #    type becomes 'class'
        # 
        #    first checks relative to callers __dirname
        #    falls back to relative to node_modules/plex/lib/
        #
        # TODO:  npm module plugins
        # 
        #    module: 'name'
        #    requires('name')['class']
        #

        console.log '\nplugin.load() with:', defn

        throw "plugin.load requires name:'name'" unless defn.name
        throw "plugin.load requires type:'type'" unless defn.type

        name   = defn.name
        type   = defn.type
        plural = i.pluralize type

        return require "./#{  plural  }/#{ name }-#{ type }"

