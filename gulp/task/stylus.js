"use strict";

const gulp = require("gulp");
const $ = require("gulp-load-plugins")();
const config = require("../config");

const path = require("path");
const _ = require("lodash");
const stylus = require("stylus");
const nodes = stylus.nodes;

const parse = (obj) => {
  let ltr;
  switch(typeof obj) {
    case "string":
      ltr = new nodes.Literal(obj);
      ltr.filename = "";
      break;
    case "number":
      ltr = new nodes.Unit(obj, "px");
      ltr.filename = "";
      break;
    case "boolean":
      ltr = new nodes.Boolean(obj);
      ltr.filename = "";
      break;
    case "object":
      ltr = _.mapValues(obj, parse);
      break;
  }
  return ltr;
};

const defineObject = (param) => (styl) => {
  _.forEach(param, (val, key) => {
    styl.define(key, parse(val), true);
  });
};

const resolveImagePath = (imagePath) => {
  const stylusPath = `${config.src}/stylus/`;
  const imageFullPath = `${config.src}/img/${imagePath.val}`;
  const relativePath = path.relative(stylusPath, imageFullPath);
  const ltr = new nodes.Literal(`url(${relativePath})`);
  ltr.filename = ""
  return ltr;
}

gulp.task("stylus", () => {
  const nib = require("nib");
  gulp
  .src(`${config.src}/stylus/index.styl`)
  .pipe($.plumber({
    errorHandler: function(err) {
      console.log(err.message);
      this.emit("end");
    },
  }))
  .pipe($.stylus({
    compress: !config.isDebug,
    sourcemap: config.isDebug ? {inline: true} : false,
    paths: [`${config.dest}/img`],
    use: [
      nib(),
      defineObject(config.siteConfig),
      (styl) => {
        styl.define("url", resolveImagePath);
        styl.define("data-url", stylus.url({limit: false}));
      },
    ],
  }))
  .pipe(gulp.dest(`${config.dest}/css`))
  .pipe($.livereload());
});
