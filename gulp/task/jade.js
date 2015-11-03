const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");

gulp.task("jade", () => {
  gulp
  .src(`${config.src}/jade/index.jade`)
  .pipe($.plumber({
    errorHandler: function(err){ // どうにかならんのか
      console.log(err.message);
      this.emit("end");
    },
  }))
  .pipe($.jade({
    data: config.siteConfig,
  }))
  .pipe(gulp.dest(config.dest))
  .pipe($.livereload());
});
