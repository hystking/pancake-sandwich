_isDebug = process.env.NODE_ENV isnt "production"

module.exports =
  isDebug: _isDebug
  src: "src"
  dest: if _isDebug then "debug" else "public"
  siteConfig: (require "require-dir") "../site-config"
