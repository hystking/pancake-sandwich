(require "require-dir") "./gulp/task"

gulp = require "gulp"
_ = require "lodash"
suddenDeath = require "./gulp/lib/sudden-death"

gulp.task "default", ->
  console.log """

  #{suddenDeath "do", .5}

  #{suddenDeath "read", .9}

  #{suddenDeath "readme", 1}

  tasks:
  #{
    _.map gulp.tasks, (task) ->
      depends = if task.dep.length > 0
        "(#{task.dep.join ", "})"
      else
        ""
      "    #{task.name} #{depends}"
    .join "\n"
  }

  """
