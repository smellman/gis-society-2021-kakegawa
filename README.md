# 掛川城3DTiles

- Node.js
- Docker
- 20GBぐらいの空き容量

## 事前準備

dockerをインストールして、イメージをダウンロードします。

```bash
docker pull smellman/lastools:latest
docker pull connormanning/entwine
```

掛川城のlasデータをダウンロードします(要wget)。

```bash
sh download.sh
```

あとで利用するコマンドをインストールしておきます。

```bash
git clone -b dev/add_proj4_text_for_japanese https://github.com/smellman/ept-tools.git
cd ept-tools
npm i
cd ..
npm install -g serve
```

## マージ作業

掛川城のデータを一つのlasにマージします。

```bash
docker run --rm -v $(pwd):/working smellman/lastools:latest sh -c 'lasmerge -i /working/*.las -o /working/kakegawa.las'
```

## 3DTiles作成

```bash
sh entwine-build.sh
cd ept-tools
node lib/app.js tile ../kakegawa_output
cd ..
```


## HTTPサーバ起動

```bash
npm install -g serve
serve -C 3000 .
```