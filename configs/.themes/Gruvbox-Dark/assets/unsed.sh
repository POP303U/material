#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#3C3836/g' \
         -e 's/rgb(100%,100%,100%)/#FBF1C7/g' \
    -e 's/rgb(50%,0%,0%)/#3C3836/g' \
     -e 's/rgb(0%,50%,0%)/#689D6A/g' \
 -e 's/rgb(0%,50.196078%,0%)/#689D6A/g' \
     -e 's/rgb(50%,0%,50%)/#3C3836/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#3C3836/g' \
     -e 's/rgb(0%,0%,50%)/#FBF1C7/g' \
	"$@"