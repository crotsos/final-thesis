#!/usr/bin/env bash 

# default values for output and scaling
export type=eps
export fontscale=20
export termconf="fontscale $fontscale font \"Gill Sans,12\" linewidth 4 rounded"

if [ -n "$1" ]; then 
  export type=$1
  echo "outputing $type type"
fi

./Introduction/IntroductionFigs/figure.sh
./Chapter1/Chapter1Figs/figure.sh
