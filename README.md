# ペラN のテンプレート

## 必要なもの
* Node.js, npm

## Installation

```
npm install
```

※ bower install もはしる

## コマンド

### npm run watch

build, serve のあと、  
jade, stylus, coffee の監視

### npm run build

リリースビルド  

### npm run sprite

src/img/sprite 以下のディレクトリのスプライトを作る    
画像は、src/img に  
jsonファイルは、src/stylus/sprite に  
それぞれ出力される  
  
使うときは、以下のようにする
```
mySprite = json("path/to/sprite.json", {hash: true})
.my-icon
  sprite(mySprite.fileName)
```

#### コマンドオプション

全部共通

* --src ソースのディレクトリを指定（デフォルトは src）
* --dest 出力のディレクトリを指定（デフォルトは、watch の場合は debug、リリースビルドの場合は public）

**オプションは、すべて"--"を挟む**

```
npm run build -- --dest public
```

## ファイル構成について

### base.jade, base.styl

* サイト共通パーツ
* mixinも基本ここ

### index.jade, style.styl, app.coffee

* エントリポイント  
* モジュールとパーツの読み込み

### module/\*\*/\*.jade, module/\*\*/\*.styl, module/\*\*/\*.coffee

* 使いまわせるモジュールとか、使いまわさなくても分けたいセクションとか
