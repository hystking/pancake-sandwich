gulp = require "gulp"
config = require "../config"

runSequence = require "run-sequence"

gulp.task "build", ->
  # some tasks (ex. embeded data-url in stylus) depend on compiled static files
  # so we need to separate them!
  copy = [
    "copy"
    "modernizr"
  ]
  compile = [
    "jade"
    "stylus"
    "coffeeify"
  ]
  runSequence ["clean"], copy, compile
