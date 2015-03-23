gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "serve", ->
  $.connect.server
    root: [config.dest]
    host: "0.0.0.0"
    port: 9000
    livereload: true
