gulp = require "gulp"
config = require "../config"

modernizr = require "modernizr"
fs = require "fs"
mkdirp = require "mkdirp"

# for options
# see below
# https://github.com/Modernizr/Modernizr/blob/master/lib/config-all.json

gulp.task "modernizr", (callback) ->
  modernizr.build
    minify: not config.isDebug
    options: [
      "html5shiv"
      "setClasses"
    ]
    "feature-detects": [
      #"css/transforms"
    ]
  , (res) ->
    mkdirp "#{config.dest}/js/lib", (err) ->
      fs.writeFile "#{config.dest}/js/lib/modernizr.js", res, callback
