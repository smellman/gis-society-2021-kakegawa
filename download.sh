#!/bin/sh

BASE_URL=https://pointcloud.pref.shizuoka.jp/lasmap/public/30XXX03010001/
BASE_FILE=30XXX03010001-
for i in `seq 1 24`; do
  wget $BASE_URL$BASE_FILE$i.las
done
