#!/bin/sh
sed -i \
         -e 's/#1f1d2e/rgb(0%,0%,0%)/g' \
         -e 's/#e0def4/rgb(100%,100%,100%)/g' \
    -e 's/#1f1d2e/rgb(50%,0%,0%)/g' \
     -e 's/#ebbcba/rgb(0%,50%,0%)/g' \
     -e 's/#1f1d2e/rgb(50%,0%,50%)/g' \
     -e 's/#e0def4/rgb(0%,0%,50%)/g' \
	"$@"
