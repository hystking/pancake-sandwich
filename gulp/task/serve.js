const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");

const connect = require("connect");
const serveStatic = require("serve-static");
const livereload = require("connect-livereload");

gulp.task("serve", () => {
  $.livereload.listen();
  connect()
  .use(livereload())
  .use(serveStatic(config.dest))
  .listen(9000);
});
