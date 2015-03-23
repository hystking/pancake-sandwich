gulp = require "gulp"
$ = do require "gulp-load-plugins"

gulp.task "test", ->
  gulp
    .src "test/**/*.coffee", read: false
    .pipe $.mocha reporter: "nyan"

