const gulp = require("gulp");
const config = require("../config");

gulp.task("watch", () => {
  gulp.watch([`${config.src}/jade/**/*`], ["jade"]);
  gulp.watch([`${config.src}/stylus/**/*`], ["stylus"]);
  gulp.watch([`${config.src}/js/**/*`], ["browserify"]);
});
