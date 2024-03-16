#!/bin/sh
sed -i \
         -e 's/#1e1e2e/rgb(0%,0%,0%)/g' \
         -e 's/#cdd6f4/rgb(100%,100%,100%)/g' \
    -e 's/#1e1e2e/rgb(50%,0%,0%)/g' \
     -e 's/#fab387/rgb(0%,50%,0%)/g' \
     -e 's/#1e1e2e/rgb(50%,0%,50%)/g' \
     -e 's/#cdd6f4/rgb(0%,0%,50%)/g' \
	"$@"
