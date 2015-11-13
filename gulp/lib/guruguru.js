"use strict";
const suddenDeath = require("./sudden-death");

const DURATION = 996;

const clearLog = () => { 
  process.stdout.cursorTo(0, 0);
  const lines = process.stdout.getWindowSize()[1];
  for(let i = 0; i < lines; i++){
    console.log("\n");
  }
};

module.exports = (gulp) => {
  let lastTask = "";
  let taskRunning = false;

  gulp.on("task_start", (e) => {
    taskRunning = true;
    clearLog();
    process.stdout.cursorTo(0, 5);
  });

  gulp.on("task_stop", (e) => {
    taskRunning = false;
    lastTask = e.task;
  });
  
  setInterval(() => {
    if(taskRunning) return;
    process.stdout.cursorTo(0, 0);
    console.log(suddenDeath(lastTask, Date.now() / DURATION % 1));
  }, DURATION / 6);
};
