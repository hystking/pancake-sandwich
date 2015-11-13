const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");

gulp.task("copy", () => {
  const pngquant = require("imagemin-pngquant");
  gulp
  .src([
    `${config.src}/img/**/*.{png,jpg,gif}`,
    `!${config.src}/img/sprite{,/**}`,
  ], {base: config.src})
  .pipe($.if(!config.isDebug, $.imagemin({
    progressive: true,
    use: [pngquant()],
  })))
  .pipe(gulp.dest(config.dest));
});
