suddenDeath = require "./sudden-death"

DURATION = 996

clearLog = ->
  process.stdout.cursorTo 0, 0
  lines = process.stdout.getWindowSize()[1]
  for i in [0...lines]
    console.log "\n"

module.exports = (gulp) ->
  lastTask = ""
  taskRunning = false

  gulp.on "task_start", (e) ->
    taskRunning = true
    clearLog()
    process.stdout.cursorTo 0, 5

  gulp.on "task_stop", (e) ->
    taskRunning = false
    lastTask = e.task
  
  setInterval ->
    return if taskRunning
    process.stdout.cursorTo 0, 0
    console.log suddenDeath lastTask, Date.now() / DURATION % 1
  , DURATION / 6
