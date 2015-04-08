gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

runSequence = require "run-sequence"

gulp.task "scaffold", ->
  """
  gulp
    .src "#{config.dest}/*",
      base: config.dest
    .pipe gulp.dest "DESTINATION"
  """
