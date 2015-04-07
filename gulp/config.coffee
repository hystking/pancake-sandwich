SRC_PATH = "src"
DEBUG_PATH = "debug"
RELEASE_PATH = "release"

args = (require "yargs").argv

_isDebug = not args.release?
_src = args.src or SRC_PATH
_dest = args.dest or (if _isDebug then DEBUG_PATH else RELEASE_PATH)

module.exports =
  isDebug: _isDebug
  src: "#{_src}"
  dest: "#{_dest}"
  siteParam: require "../site-param"
