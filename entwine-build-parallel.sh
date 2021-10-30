#!/bin/sh

input=/entwine/kakegawa.las
output=/entwine/kakegawa_output

seq 64 | parallel --no-notice docker run --rm -u `id -u`:`id -g` -v $(pwd):/entwine connormanning/entwine build -t 10 --subset {} 64 -i $input -o $output --srs EPSG:2450 --deep --scale 0.001
docker run --rm -u `id -u`:`id -g` -v $(pwd):/entwine connormanning/entwine merge -o $output
