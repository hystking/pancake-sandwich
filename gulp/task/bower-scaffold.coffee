gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "bower-scaffold", ->
  try
    mainBowerFiles = do require "main-bower-files"
  catch e
    console.log e
    return

  gulp.src mainBowerFiles
    .pipe $.if not config.isDebug, $.uglify
      preserveComments: "some"
    .pipe gulp.dest "#{config.dest}/js/lib"
