"use strict";

let fs = require("fs");
let tap = require("tap");

let statTest = (t) => (err, stat) => {
  t.ok(!err, "file exists");
  t.ok(stat.size > 0, "file size bigger than 0");
  t.end();
};

tap.test("can build index.html", (t) => {
  fs.stat("public/index.html", statTest(t));
});

tap.test("can build index.css", (t) => {
  fs.stat("public/css/index.css", statTest(t));
});

tap.test("can build index.js", (t) => {
  fs.stat("public/js/index.js", statTest(t));
});

tap.test("can build modernizr.js", (t) => {
  fs.stat("public/js/lib/modernizr.js", statTest(t));
});
