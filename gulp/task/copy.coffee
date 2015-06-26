gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "copy", ->
  pngquant = require "imagemin-pngquant"
  gulp
    .src [
      "#{config.src}/img/**/*.{png,jpg,gif}"
      "!#{config.src}/img/sprite{,/**}"
      "#{config.src}/js/**/*.js"
    ],
      base: config.src
    .pipe $.if not config.isDebug, $.imagemin
      progressive: true
      use: [pngquant()]
    .pipe gulp.dest config.dest
