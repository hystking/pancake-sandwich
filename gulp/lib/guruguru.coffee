suddenDeath = require "./sudden-death"

module.exports = (gulp, rotatingSpeed) ->
  lastTask = ""
  taskStarted = false
  times = 0

  gulp.on "task_start", (e) ->
    taskStarted = true
    stdout = process.stdout
    stdout.cursorTo 0, 0
    lines = process.stdout.getWindowSize()[1]
    for i in [0...lines]
      console.log "\n"
    stdout.cursorTo 0, 6

  gulp.on "task_stop", (e) ->
    lastTask = e.task
    times++
    taskStarted = false
  
  steps = 6
  duration = 1600 / (rotatingSpeed or 1)
  interval = duration / steps | 0

  setInterval =>
    return if taskStarted
    t = Date.now() / duration % 1
    t = 1 - t if times % 2 is 0
    process.stdout.cursorTo 0, 0
    suddenDeath lastTask, t
  , interval
