const gulp = require("gulp");
const config = require("../config");

const modernizr = require("modernizr");
const fs = require("fs");
const mkdirp = require("mkdirp");

/*
   for options
   see below
   https://github.com/Modernizr/Modernizr/blob/master/lib/config-all.json
*/

gulp.task("modernizr", (callback) => {
  modernizr.build({
    minify: !config.isDebug,
    options: [
      // "html5shiv",
      // "setClasses",
    ],
    "feature-detects": [
      // "css/transforms"
    ],
  }, (res) =>
  mkdirp(`${config.dest}/js/lib`, (err) => {
    fs.writeFile(`${config.dest}/js/lib/modernizr.js`, res, callback);
  }));
});
