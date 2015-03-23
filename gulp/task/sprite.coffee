gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

gulp.task "sprite", ->
  nsg = require "node-sprite-generator"
  dirname = args.dir
  pixelRatio = if opt.isPc then 1 else 2
  return if not dirname?
  nsg
    src: ["#{opt.src}/img/#{dirname}/*.png"]
    spritePath: "#{opt.src}/img/#{dirname}.png"
    stylesheetPath: "#{opt.src}/stylus/sprite/#{dirname}#{opt.suffix}.styl"
    stylesheetOptions:
      prefix: "#{dirname}-"
      spritePath: "../img/#{dirname}.png"
      pixelRatio: pixelRatio
