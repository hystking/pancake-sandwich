const DOMAIN = "example.org";
const PATH = "/";
const URL_INDEX = `http://${DOMAIN}${PATH}`;

module.exports = {
  slug: "peran",
  title: "ページタイトル",
  keywords: "キーワード",
  description: "ディスクリプション",
  urlIndex: URL_INDEX,
  ogImage: `${URL_INDEX}img/ogp.jpg`,
};
