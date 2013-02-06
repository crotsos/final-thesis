#!/usr/bin/env bash 

gnuplot << EOF

set key on
set xlabel "year"
set ylabel "Data (in TB/month)"

set style data histograms
set style histogram rowstacked
set boxwidth 0.5 relative
set style fill solid noborder 0.5
set datafile separator " "

# set terminal pdfcairo font "Gill Sans,9" linewidth 4 rounded
set terminal ${type}cairo termconf

set output "Introduction/IntroductionFigs/mobile.$type"
plot 'Introduction/IntroductionFigs/mobile.data' \
  using 2 t "Data", \
  '' using 3:xticlabels(1) t "File Sharing", \
  '' using 4:xticlabels(1) t "Video", \
  '' using 5:xticlabels(1) t "VoIP", \
  '' using 6:xticlabels(1) t "Gaming", \
  '' using 7:xticlabels(1) t "M2M"
EOF

