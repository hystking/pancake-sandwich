const HIRAGINO_GOTHIC = "\"Hiragino Kaku Gothic ProN\", \"ヒラギノ角ゴ ProN W3\"";
const HIRAGINO_MINCHO = "\"Hiragino Mincho ProN\", \"ヒラギノ明朝 ProN W3\"";
const YU_GOTHIC = "YuGothic, \"游ゴシック\"";
const YU_MINCHO = "YuMincho, \"游明朝\"";
const MEIRYO = "Meiryo, \"メイリオ\"";

module.exports = {
  gothic: `${YU_GOTHIC}, ${HIRAGINO_GOTHIC}, ${MEIRYO}, sans-serif`,
  mincho: `${YU_MINCHO}, ${HIRAGINO_MINCHO}, ${MEIRYO}, serif`,
};
