suddenDeath = require "./sudden-death"

clearLog = ->
  process.stdout.cursorTo 0, 0
  lines = process.stdout.getWindowSize()[1]
  for i in [0...lines]
    console.log "\n"

module.exports = (gulp, rotatingSpeed) ->
  lastTask = ""
  taskStarted = false
  reversed = false
  rotatingSpeed or= 1
  duration = 1000 / rotatingSpeed

  gulp.on "task_start", (e) ->
    taskStarted = true
    clearLog()
    process.stdout.cursorTo 0, 5

  gulp.on "task_stop", (e) ->
    taskStarted = false
    reversed = not reversed
    lastTask = e.task
  
  setInterval =>
    return if taskStarted
    t = Date.now() / duration % 1
    t = 1 - t if reversed
    process.stdout.cursorTo 0, 0
    console.log suddenDeath lastTask, t
  , duration / 6 | 0
