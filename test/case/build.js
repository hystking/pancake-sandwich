"use strict";

const fs = require("fs");
const tap = require("tap");
const config = require("../../gulp/config");

const fileTest = (target, original) => (t) => {
  t.plan(3);
  fs.stat(target, (err, stat) => {
    t.ok(!err, "exists");
    t.ok(stat.size > 0, "size bigger than 0");
  });
  fs.readFile(target, (err, targetChunk) => {
    fs.readFile(original, (err, originalChunk) => {
      t.equal(targetChunk.toString(), originalChunk.toString(), "equal to original");
    });
  });
};

tap.test(
  "index.html",
  fileTest(`${config.dest}/index.html`, `${__dirname}/../build/${config.dest}/index.html`)
);

tap.test(
  "index.js",
  fileTest(`${config.dest}/js/index.js`, `${__dirname}/../build/${config.dest}/index.js`)
);

tap.test(
  "index.css",
  fileTest(`${config.dest}/css/index.css`, `${__dirname}/../build/${config.dest}/index.css`)
);

tap.test(
  "modernizr.js",
  fileTest(`${config.dest}/js/lib/modernizr.js`, `${__dirname}/../build/${config.dest}/modernizr.js`)
);
