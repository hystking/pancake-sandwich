gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "bower-scaffold", ->
  mainBowerFiles = require "main-bower-files"
  gulp.src mainBowerFiles()
    .pipe $.if not config.isDebug, $.uglify
      preserveComments: "some"
    .pipe gulp.dest "#{config.dest}/js/lib"

