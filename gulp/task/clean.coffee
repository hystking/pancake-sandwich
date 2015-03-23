gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "clean", (callback) ->
  del = require "del"
  del config.dest, callback

