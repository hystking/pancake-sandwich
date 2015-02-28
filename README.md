# ペラN のテンプレートです

## 必要なもの
* Node.js, npm
* GraphicsMagick (スプライトの生成に使う)

## Installation

1. GraphicsMagick をインストール
  ```sh
  brew install graphicsmagick
  ```

2. npm install する
  ```
  npm install
  ```

## コマンド

### npm run build

ビルド  

### npm run serve

0.0.0.0:9000 にサーバを立てる

### npm run watch

build, serve のあと、
jade, stylus, coffee の監視

### npm run bower

bower install のあと、
main ファイルを src/js/lib 以下に吐き出す

### npm run sprite -- --dir directory_name

スプライト画像と、スプライト用のstylusを作る  
パスは、src/imgからの相対パス  

src/stylus/sprite/directory_name.styl  
にスプライト用の mixin が記述された stylus 用のファイルが書き出される  

### npm test

test/ 以下のテストを走らせる。  
phantom とかは入れてないので、ユニットテストだけ

#### コマンドオプション

全部共通です。

* --src source directory
* --dest destination directory
* --release release build
* --pc switch enviroment to pc mode

**オプションは、すべて"--"を挟む**

```
npm run build -- --release
```

## ファイル構成について

### base.jade, base.styl

* サイト共通パーツ
* mixinも基本ここ

### index.jade, style.styl, app.coffee

* エントリポイント  
* モジュールとパーツの読み込み。

### module/\*\*/\*.jade, module/\*\*/\*.styl, module/\*\*/\*.coffee

* モジュールとかセクションとか

### CSS の独立性を維持するために

moduleは極力、**"全体をラッパでくくらないスタイルを記述すべき"**

#### 例

index.jade
```jade
.slug
  .some-section
    // some content
```

index.styl
```
.slug
  .some-section
    @import module/some-section
```
