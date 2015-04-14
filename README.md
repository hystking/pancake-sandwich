# ペラN のテンプレート

## 必要なもの
* Node.js, npm

## Installation

```
npm install
```

※ bower install もはしる

## コマンド

### npm run build

ビルド  

### npm run serve

0.0.0.0:9000 にサーバを立てる

### npm run watch

build, serve のあと、  
jade, stylus, coffee の監視

### npm run sprite

src/img/sprite 以下のディレクトリのスプライトを作る    
画像は、src/img に  
jsonファイルは、src/stylus/sprite に  
それぞれ出力される
    
個別のタスクは、 sprite-#{directory_name} で登録される

#### コマンドオプション

全部共通

* --src ソースのディレクトリを指定（デフォルトは src）
* --dest 出力のディレクトリを指定（デフォルトは debug、リリースビルドの場合は release）
* --release つけるとリリースビルドになる（gulp の task の config.isDebug が false になる）

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
* モジュールとパーツの読み込み

### module/\*\*/\*.jade, module/\*\*/\*.styl, module/\*\*/\*.coffee

* 使いまわせるモジュールとか、使いまわさなくても分けたいセクションとか
