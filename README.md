# 掛川城3DTiles

## 事前準備

dockerをインストールして、イメージをダウンロードします。

```bash
docker pull smellman/lastools:latest
docker pull ha4db/py3dtiles
```

掛川城のlasデータをダウンロードします(要wget)。

```bash
sh download.sh
```

## マージ作業

掛川城のデータを一つのlasにマージします。

```bash
docker run --rm -v $(pwd):/working smellman/lastools:latest sh -c 'lasmerge -i /working/*.las -o /working/kakegawa.las'
```

## 3DTiles作成

```bash
docker run --rm -v $(pwd):/working ha4db/py3dtiles py3dtiles convert /working/kakegawa.las --out /working/tiles
```

## HTTPサーバ起動

```bash
npm install -g serve
serve -C 3000 .
```