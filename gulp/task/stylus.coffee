gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

path = require "path"
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

resolveImagePath = (imagePath) ->
  stylusPath = "#{config.src}/stylus/"
  imagePath = "#{config.src}/img/#{imagePath.val}"
  relativePath = path.relative stylusPath, imagePath
  ltr = new nodes.Literal "url(#{relativePath})"
  ltr.filename = ""
  ltr

gulp.task "stylus", ->
  nib = require "nib"
  gulp
    .src "#{config.src}/stylus/index.styl"
    .pipe $.plumber
      errorHandler: (err) ->
        console.log err.message
        @emit "end"
    .pipe $.stylus
      compress: not config.isDebug
      sourcemap: inline: true if config.isDebug
      paths: ["#{config.dest}/img"]
      use: [
        nib()
        defineObject config.siteConfig
        (styl) ->
          styl.define "url", resolveImagePath
          styl.define "data-url", stylus.url limit: false
      ]
    .pipe gulp.dest "#{config.dest}/css"
    .pipe $.livereload()
