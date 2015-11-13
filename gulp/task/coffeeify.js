const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");
const colors = require("colors");

const browserify = require("browserify");
const through2 = require("through2");

const coffeeify = (opt) => {
  return through2.obj((file, enc, next) => {
    browserify(opt)
    .add(file.path)
    .bundle((err, res) => {
      file.contents = res ? res : null;
      next(err, file);
    });
  })
};

gulp.task("coffeeify", () => {
  gulp
  .src(`${config.src}/coffee/index.coffee`)
  .pipe($.if(config.isDebug, $.sourcemaps.init()))
  .pipe($.plumber({
    errorHandler: function(err) {
      console.log(colors.red("[ERROR]", err.annotated || err.message || err));
      this.emit("end");
    },
  }))
  .pipe(coffeeify({
    extensions: [".coffee", ".json"],
    transform: ["coffeeify"],
    debug: config.isDebug,
  }))
  .pipe($.if(!config.isDebug, $.uglify({
    preserveComments: "some",
  })))
  .pipe($.if(config.isDebug, $.sourcemaps.write()))
  .pipe($.rename({
    extname: ".js",
  }))
  .pipe(gulp.dest(`${config.dest}/js`))
  .pipe($.livereload());
});
