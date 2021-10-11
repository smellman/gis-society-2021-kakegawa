#!/bin/sh

input=/entwine/kakegawa.las
output=/entwine/kakegawa_output

for i in `seq 64`;
do
  docker run -it --rm -v $(pwd):/entwine connormanning/entwine build -t 10 --subset $i 64 -i $input -o $output --srs EPSG:2450 --deep --scale 0.001
done
docker run -it --rm -v $(pwd):/entwine connormanning/entwine merge -o $output