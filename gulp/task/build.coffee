gulp = require "gulp"
config = require "../config"

runSequence = require "run-sequence"

gulp.task "build", ->
  copy = [
    "copy"
    "bower-scaffold"
    "modernizr"
  ]
  build = [
    "jade"
    "stylus"
    "coffeeify"
  ]
  if config.isDebug
    runSequence ["clean"], copy, build
  else
    runSequence ["clean"], copy, build, ["scaffold"]
