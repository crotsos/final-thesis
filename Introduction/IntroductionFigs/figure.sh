#!/usr/bin/env bash 

echo plotting Introduction
gnuplot << EOF

set key on
set key left top reverse
set xlabel "year"

set style data histograms
set style histogram rowstacked
set boxwidth 0.5 relative
set style fill solid noborder 0.5
set datafile separator " "

set terminal ${type}cairo $termconf

set output "Introduction/IntroductionFigs/mobile.$type"
set ylabel "Data (in PB/month)"

set y2tics 0.1 nomirror
set y2range [0:1]
set y2label "frequency"

plot 'Introduction/IntroductionFigs/mobile.data.bk' \
  using 2 t "Data" lt 4 axes x1y1, \
  '' using 3:xticlabels(1) t "File Sharing" lt 1 axes x1y1, \
  '' using 4:xticlabels(1) t "Video" lt 2 axes x1y1, \
  '' using 5:xticlabels(1) t "VoIP" lt 5 axes x1y1, \
  '' using 6:xticlabels(1) t "Game" lt 6 axes x1y1, \
  '' using 7:xticlabels(1) t "M2M" lt 7 axes x1y1, \
  '' using 8:xticlabels(1) w lines t "" lt 4 axes x1y2, \
  '' using 9:xticlabels(1) w lines t "" lt 1 axes x1y2, \
  '' using 10:xticlabels(1) w lines t "" lt 2 axes x1y2, \
  '' using 11:xticlabels(1) w lines t "" lt 5 axes x1y2, \
  '' using 12:xticlabels(1) w lines t "" lt 6 axes x1y2, \
  '' using 13:xticlabels(1) w lines t "" lt 7 axes x1y2


set output "Introduction/IntroductionFigs/internet.$type"
set ylabel "Data (in EB/month)"
plot 'Introduction/IntroductionFigs/fixed_traffic.data.bk' \
  using 2 t "File Sharing" lt 1 axes x1y1, \
  '' using 3:xticlabels(1) t "Video" lt 2 axes x1y1, \
  '' using 4:xticlabels(1) t "Web, Mail & data" lt 4 axes x1y1, \
  '' using 5:xticlabels(1) t "Game" lt 6 axes x1y1, \
  '' using 6:xticlabels(1) t "VoIP" lt 5 axes x1y1, \
  '' using 7:xticlabels(1) w lines t "" lt 1 axes x1y2, \
  '' using 8:xticlabels(1) w lines t "" lt 2 axes x1y2, \
  '' using 9:xticlabels(1) w lines t "" lt 4 axes x1y2, \
  '' using 10:xticlabels(1) w lines t "" lt 6 axes x1y2, \
  '' using 10:xticlabels(1) w lines t "" lt 7 axes x1y2

EOF

