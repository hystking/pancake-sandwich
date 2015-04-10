gulp = require "gulp"
$ = do require "gulp-load-plugins"
config = require "../config"

path = require "path"
glob = require "glob"
_ = require "lodash"
isDirectory = require "is-directory"

createSpriteTask = (dirPath) ->
  name = path.basename dirPath
  taskName = "sprite-#{name}"
  gulp.task taskName, ->
    spriteData = gulp.src "#{dirPath}/*.png"
      .pipe $.spritesmith
        imgName: "#{name}.png"
        cssName: "#{name}.json"
        imgPath: "#{name}.png"
        cssVarMap: (sprite) -> sprite.source_image = undefined
    spriteData.img.pipe gulp.dest "#{config.src}/img"
    spriteData.css.pipe gulp.dest "#{config.src}/stylus/sprite"
  return taskName

taskNames = _ glob.sync "#{config.src}/img/sprite/*"
  .filter (p) -> isDirectory.sync p
  .map createSpriteTask
  .value()

gulp.task "sprite", taskNames
