const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");

const path = require("path");
const glob = require("glob");
const _ = require("lodash");
const isDirectory = require("is-directory");

const createSpriteTask = (dirPath) => {
  const name = path.basename(dirPath);
  taskName = `sprite-${name}`;
  gulp.task(taskName, () => {
    spriteData = gulp.src(`${dirPath}/*.png`)
    .pipe($.spritesmith({
      imgName: `${name}.png`,
      cssName: `${name}.json`,
      imgPath: `${name}.png`,
      cssVarMap: (sprite) => {sprite.source_image = undefined},
    }));
    spriteData.img.pipe(gulp.dest(`${config.src}/img`));
    spriteData.css.pipe(gulp.dest(`${config.src}/stylus/sprite`));
  });
  return taskName
};

taskNames = _(glob.sync(`${config.src}/img/sprite/*`))
.filter((p) => isDirectory.sync(p))
.map(createSpriteTask)
.value();

gulp.task("sprite", taskNames);
