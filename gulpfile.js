require("require-dir")("./gulp/task");

const gulp = require("gulp");
const _ = require("lodash");
const suddenDeath = require("./gulp/lib/sudden-death");

gulp.task("default", () => {
  console.log(`
${suddenDeath("do", .5)}

${suddenDeath("read", .9)}

${suddenDeath("readme", 1)}

tasks:
  ${_.map(gulp.tasks, task => task.name).join("\n  ")}`)
});
