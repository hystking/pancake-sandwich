args = (require "yargs").argv

_isDebug = not args.release?

module.exports =
  isDebug: _isDebug
  src: args.src or "src"
  dest: args.dest or (if _isDebug then "debug" else "release")
  siteParam: require "../site-param"
