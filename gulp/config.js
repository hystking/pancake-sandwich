"use strict";

const _isDebug = process.env.NODE_ENV !== "production"

module.exports = {
  isDebug: _isDebug,
  src: "src",
  dest: _isDebug ? "debug" : "public",
  siteConfig: require("require-dir")("../site-config"),
};
