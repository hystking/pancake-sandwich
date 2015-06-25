gulp = require "gulp"
config = require "../config"

gulp.task "scaffold", ->
  """
  gulp
    .src "#{config.dest}/*",
      base: config.dest
    .pipe gulp.dest "DESTINATION"
  """
