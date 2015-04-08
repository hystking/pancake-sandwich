gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

connect = require "connect"
serveStatic = require "serve-static"
livereload = require "connect-livereload"

gulp.task "serve", ->
  $.livereload.listen()
  connect()
    .use livereload()
    .use serveStatic config.dest
    .listen 9000
