#!/bin/sh

for file in $(ls *.dot) ; do
  dot ${file} -Tpng \
    -Nfontname="Open Sans" \
    -Efontname="Open Sans" \
    -Gfontname="Open Sans" \
    -o ${file%.*}.png
done
