#!/bin/sh
sed -i \
         -e 's/#EFF1F5/rgb(0%,0%,0%)/g' \
         -e 's/#4C4F69/rgb(100%,100%,100%)/g' \
    -e 's/#EFF1F5/rgb(50%,0%,0%)/g' \
     -e 's/#FE640B/rgb(0%,50%,0%)/g' \
     -e 's/#EFF1F5/rgb(50%,0%,50%)/g' \
     -e 's/#4C4F69/rgb(0%,0%,50%)/g' \
	"$@"
