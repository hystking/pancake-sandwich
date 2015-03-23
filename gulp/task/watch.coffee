gulp = require "gulp"
config = require "../config"

gulp.task "watch", ["guruguru", "serve", "build"], ->
  gulp.watch ["#{config.src}/jade/**/*"], ["jade"]
  gulp.watch ["#{config.src}/stylus/**/*"], ["stylus"]
  gulp.watch ["#{config.src}/coffee/**/*"], ["coffeeify"]
