const gulp = require("gulp");

gulp.task("guruguru", () => {
  const guruguru = require("../lib/guruguru");
  guruguru(gulp);
});
