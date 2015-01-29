SRC_PATH = "src"
DEBUG_PATH = "debug"
RELEASE_PATH = "release"
SP_SUFFIX = ""
PC_SUFFIX = "-pc"
SITE_PARAM_PATH = "./site-param"

##################################################

gulp = require "gulp"
$ = (require "gulp-load-plugins")()
runSequence = require "run-sequence"
args = (require "yargs").argv

##################################################

opt = do ->
  _isPc = args.pc?
  _isDebug = not args.release?
  _suffix = if _isPc then PC_SUFFIX else SP_SUFFIX
  _src = args.src or SRC_PATH
  _dest = args.dest or (if _isDebug then DEBUG_PATH else RELEASE_PATH)
  {
    isPc: _isPc
    isDebug: _isDebug
    src: _src
    dest: "#{_dest}#{_suffix}"
  }
siteParam = (require SITE_PARAM_PATH) opt

##################################################

gulp.task "jade", ->
  gulp
    .src "#{opt.src}/jade/index.jade"
    .pipe $.plumber
      errorHandler: (err) -> console.log err.message
    .pipe $.jade
      pretty: true
      data: siteParam
    .pipe gulp.dest opt.dest
    .pipe $.connect.reload()

gulp.task "stylus", ->
  nib = require "nib"
  stylusUse = require "./lib/stylus-use"
  gulp
    .src "#{opt.src}/stylus/index.styl"
    .pipe $.plumber
      errorHandler: (err) -> console.log err.message
    .pipe $.stylus
      use: [
        nib()
        stylusUse siteParam
      ]
      compress: not opt.isDebug
      sourcemap: inline: opt.isDebug if opt.isDebug
    .pipe gulp.dest "#{opt.dest}/css"
    .pipe $.connect.reload()
  
gulp.task "coffeeify", ->
  coffeeify = require "./lib/coffeeify"
  gulp
    .src "#{opt.src}/coffee/index.coffee"
    .pipe $.if opt.isDebug, $.sourcemaps.init()
    .pipe coffeeify
      extensions: [".coffee", ".json"]
      debug: opt.isDebug
    .pipe $.if not opt.isDebug, $.uglify
      preserveComments: "some"
    .pipe $.if opt.isDebug, $.sourcemaps.write()
    .pipe $.sourcemaps.write()
    .pipe $.rename
      extname: ".js"
    .pipe gulp.dest "#{opt.dest}/js"
    .pipe $.connect.reload()

gulp.task "copy", ->
  gulp
    .src [
      "#{opt.src}/img/**/*.png"
      "#{opt.src}/img/**/*.jpg"
      "#{opt.src}/img/**/*.gif"
      "#{opt.src}/js/**/*.js"
    ],
      base: opt.src
    .pipe gulp.dest opt.dest
    .pipe $.connect.reload()

gulp.task "sprite", ->
  dirname = args.dir
  pixelRatio = if opt.isPc then 1 else 2
  return if not dirname?
  nsg
    src: ["#{opt.src}/img/#{dirname}/*.png"]
    spritePath: "#{opt.src}/img/#{dirname}.png"
    stylesheetPath: "#{opt.src}/stylus/sprite/#{dirname}#{opt.suffix}.styl"
    stylesheetOptions:
      prefix: "#{dirname}-"
      spritePath: "../img/#{dirname}.png"
      pixelRatio: pixelRatio

gulp.task "serve", ->
  $.connect.server
    root: [opt.dest]
    host: "0.0.0.0"
    port: 9000
    livereload: true

gulp.task "test", ->
  gulp
    .src "test/**/*.coffee", read: false
    .pipe $.mocha reporter: "nyan"

gulp.task "guruguru", ->
  guruguru = require "./lib/guruguru"
  rotatingSpeed = args.speed
  guruguru gulp, rotatingSpeed

gulp.task "watch", ["guruguru"], ->
  
  gulp.watch [
    "#{opt.src}/jade/**/*.jade"
    "#{opt.src}/jade/**/*.html"
  ], ["jade"]

  gulp.watch [
    "#{opt.src}/stylus/**/*.styl"
    "#{opt.src}/stylus/**/*.css"
  ], ["stylus"]

  gulp.watch [
    "#{opt.src}/coffee/**/*.coffee"
    "#{opt.src}/coffee/**/*.js"
  ], ["coffeeify"]

  gulp.watch "*site-param.coffee", ->
    runSequence [
      "reload-site-param"
    ], [
      "jade"
      "stylus"
      "coffeeify"
    ]

gulp.task "bower-scaffold", ->
  mainBowerFiles = require "main-bower-files"
  gulp.src mainBowerFiles()
    .pipe $.if not opt.isDebug, $.uglify
      preserveComments: "some"
    .pipe gulp.dest "#{opt.dest}/js/lib"

gulp.task "clean", (callback) ->
  del = require "del"
  del opt.dest, callback

gulp.task "reload-site-param", ->
  delete require.cache[require.resolve SITE_PARAM_PATH]
  siteParam = (require SITE_PARAM_PATH) opt

gulp.task "build", ->
  runSequence [
    "clean"
  ], [
    "jade"
    "stylus"
    "coffeeify"
    "copy"
    "bower-scaffold"
  ]
