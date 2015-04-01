SP_SUFFIX = ""
PC_SUFFIX = "-pc"

SRC_PATH = "src"
DEBUG_PATH = "debug"
RELEASE_PATH = "release"

args = (require "yargs").argv

_isPc = args.pc?
_isDebug = not args.release?
_suffix = if _isPc then PC_SUFFIX else SP_SUFFIX
_src = args.src or SRC_PATH
_dest = args.dest or (if _isDebug then DEBUG_PATH else RELEASE_PATH)

module.exports =
  isPc: _isPc
  isDebug: _isDebug
  src: "#{_src}#{_suffix}"
  dest: "#{_dest}#{_suffix}"
  siteParam: (require "../site-param")
    isPc: _isPc
    isDebug: _isDebug
