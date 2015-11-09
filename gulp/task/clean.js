const gulp = require("gulp");
const config = require("../config");

gulp.task("clean", (callback) => {
  const del = require("del");
  del(config.dest).then(() => callback());
});
