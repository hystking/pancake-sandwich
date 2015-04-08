gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "jade", ->
  gulp
    .src "#{config.src}/jade/index.jade"
    .pipe $.plumber
      errorHandler: (err) ->
        console.log err.message
        @emit "end"
    .pipe $.jade
      pretty: true
      data: config.siteParam
    .pipe gulp.dest config.dest
    .pipe $.livereload()
