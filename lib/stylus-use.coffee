_ = require "lodash"
stylus = require "stylus"

nodes = stylus.nodes

parse = (obj) ->
  switch typeof obj
    when "string"
      ltr = new nodes.Literal obj
      ltr.filename = ""
      ltr
    when "number"
      ltr = new nodes.Unit obj, "px"
      ltr.filename = ""
      ltr
    when "boolean"
      ltr = new nodes.Boolean obj
      ltr.filename = ""
      ltr
    when "object"
      _.mapValues obj, parse

module.exports = (param) -> (styl) ->
  _.each param, (val, key) ->
    styl.define key, (parse val), true
