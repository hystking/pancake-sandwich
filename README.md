# PancakeSandwich

## 必要なもの
* Node.js, npm

## Installation

```
npm install
```

## Make a Sandwich

```
./make.sh
```

## コマンド

### npm run dev

開発用タスク  
build, serve のあと、  
jade, stylus, js の監視

### npm run build

ビルド  
デフォルトではpublic以下にファイルが生成される

### npm run sprite

src/img/sprite 以下のディレクトリのスプライトを作る    
画像は、src/img に  
jsonファイルは、src/stylus/sprite に  
それぞれ出力される  
  
使うときは、以下のようにする
```
mySprite = spriteObject("path/to/sprite.json")
.my-icon
  sprite(mySprite.fileName)
```
