HIRAGINO_GOTHIC = "\"Hiragino Kaku Gothic ProN\", \"ヒラギノ角ゴ ProN W3\""
HIRAGINO_MINCHO = "\"Hiragino Mincho ProN\", \"ヒラギノ明朝 ProN W3\""
YU_GOTHIC = "YuGothic, \"游ゴシック\""
YU_MINCHO = "YuMincho, \"游明朝\""
MEIRYO = "Meiryo, \"メイリオ\""

DOMAIN = "example.org"
PATH = "/"
URL_INDEX = "http://#{DOMAIN}#{PATH}"

module.exports =
  pixelRatio: 1
  meta:
    slug: "peran"
    title: "ページタイトル"
    keywords: "キーワード"
    description: "ディスクリプション"
    urlIndex: URL_INDEX
    ogImage: "#{URL_INDEX}img/ogp.jpg"

  font:
    gothic: "#{YU_GOTHIC}, #{HIRAGINO_GOTHIC}, #{MEIRYO}, sans-serif"
    mincho: "#{YU_MINCHO}, #{HIRAGINO_MINCHO}, #{MEIRYO}, serif"

  layout:
    width: 640
