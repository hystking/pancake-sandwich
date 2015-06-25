args = (require "yargs").argv

_isDebug = process.env.NODE_ENV isnt "production"

module.exports =
  isDebug: _isDebug
  src: args.src or "src"
  dest: args.dest or (if _isDebug then "debug" else "public")
  siteConfig: (require "require-dir") "../site-config"
