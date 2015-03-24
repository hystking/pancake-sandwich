gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

path = require "path"
glob = require "glob"
_ = require "lodash"
isDirectory = require "is-directory"

paths = glob.sync "#{config.src}/img/sprite/*"

createSpriteTask = (dirPath) ->
  name = path.basename dirPath
  taskName = "sprite-#{name}"
  gulp.task taskName, ->
    spriteData = gulp.src "#{dirPath}/*.png"
      .pipe $.plumber()
      .pipe $.spritesmith
        imgName: "#{name}.png"
        cssName: "#{name}.styl"
        imgPath: "../img/#{name}.png"
    spriteData.img.pipe gulp.dest "#{config.src}/img"
    spriteData.css.pipe gulp.dest "#{config.src}/stylus/sprite"
  return taskName

taskNames = _ paths
  .filter (p) -> isDirectory.sync p
  .map createSpriteTask
  .value()

gulp.task "sprite", taskNames
