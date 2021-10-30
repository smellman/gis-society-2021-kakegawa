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
sudo npm install -g serve
```

## マージ作業

掛川城のデータを一つのlasにマージします。

```bash
docker run --rm -u `id -u`:`id -g` -v $(pwd):/working smellman/lastools:latest sh -c 'lasmerge -i /working/*.las -o /working/kakegawa.las'
```

## 3DTiles作成

```bash
sh entwine-build.sh
cd ept-tools
node lib/app.js tile ../kakegawa_output
cd ..
```

注: GNU Parallelが入っている場合はentwine-build-parallel.shを代わりに利用すると高速にビルドできます。

## HTTPサーバ起動

```bash
serve -C 3000 .
```
