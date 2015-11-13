const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");
const colors = require("colors");

const browserify = require("browserify");
const through2 = require("through2");

const $browserify = (opt) => {
  return through2.obj((file, enc, next) => {
    browserify(opt)
    .transform("babelify", {presets: ["es2015"]})
    .add(file.path)
    .bundle((err, res) => {
      file.contents = res ? res : null;
      next(err, file);
    });
  })
};

gulp.task("browserify", () => {
  gulp
  .src(`${config.src}/js/index.js`)
  .pipe($.plumber({
    errorHandler: function(err) {
      console.log(colors.red("[ERROR]", err.annotated || err.message || err));
      this.emit("end");
    },
  }))
  .pipe($browserify({
    extensions: [".js", ".json"],
    debug: config.isDebug,
  }))
  .pipe($.if(!config.isDebug, $.uglify({
    preserveComments: "some",
  })))
  .pipe($.rename({
    extname: ".js",
  }))
  .pipe(gulp.dest(`${config.dest}/js`))
  .pipe($.livereload());
});
