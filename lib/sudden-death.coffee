_ = require "lodash"
colors = require "colors"

FACE = "’ω’   "
WAVE_LEFT = " ▂▅▇█▓▒░"
WAVE_RIGHT = "░▒▓█▇▅▂"
POPUP_TOP = colors.yellow "    ＿人人人人人＿"
POPUP_LEFT = colors.yellow "   ＞"
POPUP_RIGHT = colors.yellow "＜"
POPUP_BOTTOM = colors.yellow "   ￣Y^Y^Y^Y^Y^Y￣"
MAX = 10
FACE_DOUBLE = FACE+FACE
FACE_SIZE = 3
FACE_LENGTH = FACE.length

ws = (n) ->
  _.reduce [0...n], ((s) -> s + " "), ""

shiftedRainbow = (msg, t) ->
  n = t * 5 | 0
  (colors.rainbow (ws n) + msg).substring n

module.exports = (msg, t=0) ->
  facePos = Math.floor FACE_LENGTH * t
  faceClipped = FACE_DOUBLE.substring facePos, facePos + FACE_SIZE
  
  msgLength = msg.length
  paddingLen = ((MAX - msgLength) / 2 | 0) + 1
  padding = ws paddingLen
  paddedMsg = "#{padding}#{msg}#{padding}"

  waveLeft = shiftedRainbow WAVE_LEFT, t
  waveRight = shiftedRainbow WAVE_RIGHT, 1-t
  head = "(#{faceClipped})"
  msgOut = colors.yellow paddedMsg.toUpperCase()

  console.log ""
  console.log POPUP_TOP
  console.log "#{POPUP_LEFT}#{msgOut}#{POPUP_RIGHT}"
  console.log POPUP_BOTTOM
  console.log "#{waveLeft}#{head}#{waveRight}"
