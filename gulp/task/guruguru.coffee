gulp = require "gulp"
args = (require "yargs").argv

gulp.task "guruguru", ->
  guruguru = require "../lib/guruguru"
  rotatingSpeed = args.speed
  guruguru gulp, rotatingSpeed
