gulp = require "gulp"
config = require "../config"

runSequence = require "run-sequence"

gulp.task "build", ->
  build = [
    "jade"
    "stylus"
    "coffeeify"
    "copy"
    "bower-scaffold"
    "modernizr"
  ]
  if config.isDebug
    runSequence ["clean"], build
  else
    runSequence ["clean"], build, ["scaffold"]
