#!/usr/bin/env bash 

# default values for output and scaling
export type=eps
export termconf="fontscale 20  font \"Gill Sans,12\" linewidth 4 rounded"

if [ -n "$1" ]; then 
  export type=$1
  echo "outputing $type type"
fi

./Introduction/IntroductionFigs/figure.sh
