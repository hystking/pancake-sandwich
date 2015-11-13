const _ = require("lodash");
const colors = require("colors");

const FACE = "’ω’   ";
const WAVE_LEFT = " ▂▅▇█▓▒░";
const WAVE_RIGHT = "░▒▓█▇▅▂";
const POPUP_TOP = colors.yellow("    ＿人人人人人＿");
const POPUP_LEFT = colors.yellow("   ＞");
const POPUP_RIGHT = colors.yellow("＜");
const POPUP_BOTTOM = colors.yellow("   ￣Y^Y^Y^Y^Y^Y￣");
const MAX = 10;
const FACE_DOUBLE = FACE + FACE;
const FACE_SIZE = 3;
const FACE_LENGTH = FACE.length;

const ws = (n) => _.reduce(_.range(n), (s) => s + " ", "");

const shiftedRainbow = (msg, t) => {
  const n = t * 5 | 0
  return colors.rainbow(ws(n) + msg).substring(n);
};

module.exports = (msg, t) => {
  if(t === void 0) t = 0;

  const facePos = Math.floor(FACE_LENGTH * t);
  const faceClipped = FACE_DOUBLE.substring(facePos, facePos + FACE_SIZE);
  
  const msgLength = msg.length;
  const paddingLen = ((MAX - msgLength) / 2 | 0) + 1;
  const padding = ws(paddingLen);
  const paddedMsg = `${padding}${msg}${padding}`;

  const waveLeft = shiftedRainbow(WAVE_LEFT, t);
  const waveRight = shiftedRainbow(WAVE_RIGHT, 1 - t);
  const head = `(${faceClipped})`;
  const msgOut = colors.yellow(paddedMsg.toUpperCase());

  return `${POPUP_TOP}
${POPUP_LEFT}${msgOut}${POPUP_RIGHT}
${POPUP_BOTTOM}
${waveLeft}${head}${waveRight}`
};
