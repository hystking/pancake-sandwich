browserify = require "browserify"
transform = require "vinyl-transform"
colors = require "colors"
coffeeify = require "coffeeify"

module.exports = (param) ->
  transform (filename) ->
    browserify filename, param
      .transform coffeeify
      .bundle()
      .on "error", (err) ->
        console.log colors.red err
        @emit "end"
