gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

browserify = require "browserify"
transform = require "vinyl-transform"
colors = require "colors"
coffeeify = require "coffeeify"

_coffeeify = (param) ->
  transform (filename) ->
    browserify filename, param
      .transform coffeeify
      .bundle()
      .on "error", (err) ->
        console.log colors.red err
        @emit "end"

gulp.task "coffeeify", ->
  gulp
    .src "#{config.src}/coffee/index.coffee"
    .pipe $.if config.isDebug, $.sourcemaps.init()
    .pipe _coffeeify
      extensions: [".coffee", ".json"]
      debug: config.isDebug
    .pipe $.if not config.isDebug, $.uglify
      preserveComments: "some"
    .pipe $.if config.isDebug, $.sourcemaps.write()
    .pipe $.rename
      extname: ".js"
    .pipe gulp.dest "#{config.dest}/js"
    .pipe $.connect.reload()
