gulp = require "gulp"
config = require "../config"

gulp.task "clean", (callback) ->
  del = require "del"
  del config.dest, callback
