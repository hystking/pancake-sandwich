gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

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

defineObject = (param) -> (styl) ->
  for key, val of param
    styl.define key, (parse val), true

gulp.task "stylus", ->
  nib = require "nib"
  gulp
    .src "#{config.src}/stylus/index.styl"
    .pipe $.plumber
      errorHandler: (err) -> console.log err.message
    .pipe $.stylus
      use: [
        nib()
        defineObject config.siteParam
      ]
      compress: not config.isDebug
      sourcemap: inline: config.isDebug if config.isDebug
    .pipe gulp.dest "#{config.dest}/css"
    .pipe $.connect.reload()
