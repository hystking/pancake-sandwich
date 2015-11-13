const gulp = require("gulp");
const config = require("../config");

const runSequence = require("run-sequence");

const copy = [
  "copy",
  "modernizr",
];

const compile = [
  "jade",
  "stylus",
  "browserify",
];

gulp.task("build", () => {
  // some tasks (ex. embeded data-url in stylus) depend on compiled static files
  // so we need to separate them!
  runSequence(["clean"], copy, compile);
});
