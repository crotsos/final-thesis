#!/usr/bin/env bash 

echo plotting chapter 1

gnuplot << EOF

set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded
set ylabel "Insertion time (msec)";
set xlabel "Number of flow entries inserted";

# set size 1,0.5;
set yrange [.01:50000];
set logscale xy;

set output "Chapter1/Chapter1Figs/flow_insertion_delay.$type";

set key right Right noreverse;
set key outside;
plot "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-wild.txt" using 1:(\$6/1000):(\$5/1000):(\$7/1000) \
     title 'sw1 - mod' with errorlines lt 1, \
     "Chapter1/Chapter1Figs/flow_insertion/nec-add-flow-wild.txt" using 1:(\$6/1000):(\$5/1000):(\$7/1000) \
     title 'sw1 - add' with errorlines lt 2, \
\
     "Chapter1/Chapter1Figs/flow_insertion/hp-mod-flow-wild.txt" using 1:(\$6/1000):(\$5/1000):(\$7/1000) \
     title 'sw2 - mod' with errorlines lt 3, \
     "Chapter1/Chapter1Figs/flow_insertion/hp-add-flow-wild.txt" using 1:(\$6/1000):(\$5/1000):(\$7/1000) \
     title 'sw2 - add' with errorlines lt 4, \
\
     "Chapter1/Chapter1Figs/flow_insertion/openvswitch-mod-flow-wild.txt" using 1:(\$6/1000):(\$5/1000):(\$7/1000) \
     title 'ovs - mod' with errorlines lt 5,\
     "Chapter1/Chapter1Figs/flow_insertion/openvswitch-add-flow-wild.txt" using 1:(\$6/1000):(\$5/1000):(\$7/1000) \
     title 'ovs - add' with errorlines lt 6;

EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded
set ylabel "Insertion time (msec)";
set xlabel "Number of flow entries inserted";
set yrange [0:20];
set xrange [10:1000];
set output "Chapter1/Chapter1Figs/flow_insertion_delay_per_flow.$type";
set key right Right noreverse;
set key outside;
set logscale x; 
plot "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-wild.txt" \
     using 1:(\$6/(\$1*1000)):(\$5/(\$1*1000)):(\$7/(\$1*1000)) \
     title 'sw1 - mod' with errorlines lt 1, \
     "Chapter1/Chapter1Figs/flow_insertion/nec-add-flow-wild.txt" \
     using 1:(\$6/(\$1*1000)):(\$5/(\$1*1000)):(\$7/(\$1 * 1000)) \
     title 'sw1 - add' with errorlines lt 2, \
\
     "Chapter1/Chapter1Figs/flow_insertion/hp-mod-flow-wild.txt" \
     using 1:(\$6/(\$1*1000)):(\$5/(\$1*1000)):(\$7/(\$1 * 1000)) \
     title 'sw2 - mod' with errorlines lt 3, \
     "Chapter1/Chapter1Figs/flow_insertion/hp-add-flow-wild.txt" \
     using 1:(\$6/(\$1*1000)):(\$5/(\$1*1000)):(\$7/(\$1 * 1000)) \
     title 'sw2 - add' with errorlines lt 4, \
\
     "Chapter1/Chapter1Figs/flow_insertion/openvswitch-mod-flow-wild.txt" \
     using 1:(\$6/(\$1*1000)):(\$5/(\$1*1000)):(\$7/(\$1 * 1000)) \
     title 'ovs - mod' with errorlines lt 5,\
     "Chapter1/Chapter1Figs/flow_insertion/openvswitch-add-flow-wild.txt" \
     using 1:(\$6/(\$1*1000)):(\$5/(\$1*1000)):(\$7/(\$1 * 1000)) \
     title 'ovs - add' with errorlines lt 6;
EOF


gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5

set ylabel "delay(msec)";
set xlabel "number of flows";
set key top left Left reverse;
set logscale xy;
set yrange [.01:100000];
set output "Chapter1/Chapter1Figs/nec_mod_flow_exact_comparison.$type";
plot "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-exact.txt" \
  using 1:(\$9/1000):(\$8/1000):(\$10/1000) title 'barrier reply' \
  with errorlines lt 1, \
  "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-exact.txt" \
  using 1:(\$12/1000):(\$11/1000):(\$13/1000) \
  title 'transmission delay' with errorlines lt 2, \
  "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-exact.txt" \
  using 1:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'first packet' with errorlines lt 3;
EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5

set ylabel "delay(msec)";
set xlabel "number of flows";
set key top left Left reverse;
set logscale xy;
set yrange [.01:100000];
set output "Chapter1/Chapter1Figs/openvswitch_mod_flow_exact_comparison.$type";
plot "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-exact.txt" \
  using 1:(\$9/1000):(\$8/1000):(\$10/1000) title 'barrier reply' \
  with errorlines lt 1, \
  "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-exact.txt" \
  using 1:(\$12/1000):(\$11/1000):(\$13/1000) \
  title 'transmission delay' with errorlines lt 2, \
  "Chapter1/Chapter1Figs/flow_insertion/nec-mod-flow-exact.txt" \
  using 1:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'first packet' with errorlines lt 3;
EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5
set key outside;
set output "Chapter1/Chapter1Figs/flow_stats_delay.$type";
set ylabel  'flow stat delay (msec)';
set yrange [1:100000];
set logscale y;
set xlabel  'flow statistics polling rate (requests/sec)';
set xrange [0.75:4.25];
plot '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/nec-exact-flow-stats-stat.txt'\
  using 16:(\$5/1000):(\$4/1000):(\$6/1000) \
  title 'switch1' with errorlines lt 1,\
  '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/hp-exact-flow-stats-stat.txt' \
  using 16:(\$5/1000):(\$4/1000):(\$6/1000) \
  title 'switch2' with errorlines lt 2,\
  '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/quantas-exact-flow-stats-stat.txt' \
  using 16:(\$5/1000):(\$4/1000):(\$6/1000) \
  title 'switch3' with errorlines lt 3,\
  '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/netfpga-exact-flow-stats-stat.txt' \
  using 16:(\$5/1000):(\$4/1000):(\$6/1000) \
  title 'netfpga' with errorlines lt 4,\
  '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/openvswitch-exact-flow-stats-stat.txt' \
  using 16:(\$5/1000):(\$4/1000):(\$6/1000) \
  title 'ovs' with errorlines lt 5;
EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5
set output "Chapter1/Chapter1Figs/flow_stats_cpu.$type";
set xrange [0.75:4.25];
set key outside;
set ylabel  'flow stat delay (msec)';
set yrange [1:100];
set xlabel  'flow statistics polling rate (requests/sec)';
set xrange [0.75:4.25];
plot '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/nec-exact-flow-stats-stat.txt'\
  using 16:14:13:15 \
  title 'switch1' with errorlines lt 1,\
  '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/hp-exact-flow-stats-stat.txt' \
  using 16:14:13:15 \
  title 'switch2' with errorlines lt 2,\
 '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/netfpga-exact-flow-stats-stat.txt' \
  using 16:14:13:15 \
  title 'netfpga' with errorlines lt 4,\
  '< grep "0001024 0001024 " Chapter1/Chapter1Figs/flow_stats/openvswitch-exact-flow-stats-stat.txt' \
  using 16:14:13:15 \
  title 'ovs' with errorlines lt 5;
EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5
set output "Chapter1/Chapter1Figs/interaction_test.$type";
set ylabel "insertion delay (usec)";
set xlabel "flow statistics polling rate (requests/sec)";
set xtics ("2" 1, "1" 2, "0.33" 3, "0.25" 4, "0" 5)
set xrange [5.25:0.75];
set logscale y;
set key outside; 
set yrange [10:90000];
plot "Chapter1/Chapter1Figs/interaction_test/nec-interaction-test.txt" \
  using 5:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'switch1' with errorlines lt 1,\
  "Chapter1/Chapter1Figs/interaction_test/hp-interaction-test.txt" \
  using 5:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'switch2' with errorlines lt 2,\
  "Chapter1/Chapter1Figs/interaction_test/quantas-interaction-test.txt" \
  using 5:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'switch3' with errorlines lt 3,\
  "Chapter1/Chapter1Figs/interaction_test/netfpga-interaction-test.txt" \
  using 5:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'netfpga' with errorlines lt 4,\
  "Chapter1/Chapter1Figs/interaction_test/openvswitch-interaction-test.txt" \
  using 5:(\$3/1000):(\$2/1000):(\$4/1000) \
  title 'ovs' with errorlines lt 5;

EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5
set output 'Chapter1/Chapter1Figs/pkt_in_delay.$type';
set logscale xy;
set xrange [0.5 : 500];
set xtics ("2000" 0.5, "1000" 1, "666" 1.5, "400" 2.5, "200" 5, \
  "100" 10, "40" 25, "20" 50, "13" 75, "10" 100, "4" 250, "2" 500, \
  "1.3" 750, "1" 1000) rotate by -90;
set xlabel  'packet rate (packets/sec)';
set ylabel  'pkt_in delay(msec)';
set key outside; 
plot \
 'Chapter1/Chapter1Figs/pkt_in_out/nec-1500-pkt-in.txt' \
  using (\$1/1000):3:2:4 title 'switch1' with errorlines lt 1, \
 'Chapter1/Chapter1Figs/pkt_in_out/hp-1500-pkt-in.txt' \
  using (\$1/1000):3:2:4 title 'switch2' with errorlines lt 2,\
  'Chapter1/Chapter1Figs/pkt_in_out/openvswitch-1500-pkt-in.txt' \
  using (\$1/1000):3:2:4 title 'ovs' with errorlines lt 4;

#'Chapter1/Chapter1Figs/pkt_in_out/openvswitch-150-pkt-in.txt' \
#  using (\$1/1000):3:2:4 title 'ovs - small' with errorlines lt 2,\
#\
#  'Chapter1/Chapter1Figs/pkt_in_out/hp-150-pkt-in.txt' \
#  using (\$1/1000):3:2:4 title 'sw2 - small' with errorlines lt 4,\
#\
#  'Chapter1/Chapter1Figs/pkt_in_out/nec-150-pkt-in.txt' \
#  using (\$1/1000):3:2:4 title 'sw1 - small' with errorlines lw 10 
EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,9" rounded size 5,1.5
set output 'Chapter1/Chapter1Figs/pkt_out_delay.$type';
set logscale x;
set xrange [0.5 : 500];
set xtics (0.5, 1, 1.5, 2.5, 5, 10, 25, 50,75, 100, 250, 500, 750, 1000) rotate by -90;
set xlabel  'interpacket gap(msec)';
set xtics ("2000" 0.5, "1000" 1, "666" 1.5, "400" 2.5, "200" 5, \
  "100" 10, "40" 25, "20" 50, "13" 75, "10" 100, "4" 250, "2" 500, \
  "1.3" 750, "1" 1000) rotate by -90;
set xlabel  'packet rate (packets/sec)';
set ylabel  'pkt_out delay(msec)';
set key outside; 
plot \
 'Chapter1/Chapter1Figs/pkt_in_out/nec-150-pkt-out.txt' \
  using (\$1/1000):3:2:4 title 'switch1' with errorlines lt 1, \
 'Chapter1/Chapter1Figs/pkt_in_out/hp-150-pkt-out.txt' \
  using (\$1/1000):3:2:4 title 'switch2' with errorlines lt 2,\
  'Chapter1/Chapter1Figs/pkt_in_out/openvswitch-150-pkt-out.txt' \
  using (\$1/1000):3:2:4 title 'ovs' with errorlines lt 4;

# 'Chapter1/Chapter1Figs/pkt_in_out/openvswitch-1500-pkt-out.txt' \
#   using (\$1/1000):3:2:4 title 'ovs - large' with errorlines lt 1,\
#      \
#   'Chapter1/Chapter1Figs/pkt_in_out/hp-1500-pkt-out.txt' \
#   using (\$1/1000):3:2:4 title 'sw2 - large' with errorlines lt 3,\
#      \
#   'Chapter1/Chapter1Figs/pkt_in_out/nec-1500-pkt-out.txt' \
#   using (\$1/1000):3:2:4 title 'sw1 - large' with errorlines lt 5,

EOF

gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,11" rounded size 5,1.5;
set output 'Chapter1/Chapter1Figs/timer_precision.$type';
set xlabel  'relative delay since first packet (sec)';
set ylabel  'timestamp error (nsec)';
set key left Left reverse inside;

plot '< gzcat Chapter1/Chapter1Figs/timer_precision/comparison_dag_pcap.txt.gz' \
  using (\$2/1000000000):(\$2-\$3) every 1000 title 'pcap' with lines lt 3,\
  '< gzcat Chapter1/Chapter1Figs/timer_precision/comparison_dag_netfpga.txt.gz' \
  using (\$2/1000000000):(\$2-\$3) every 1000 title 'netfpga oflops-design' with lines lt 2; 
EOF


gnuplot << EOF
set terminal ${type}cairo fontscale $fontscale font "Gill Sans,10" rounded size 5,1.5;
set key reverse inside;
set output 'Chapter1/Chapter1Figs/switch-media-delay.$type';
set xlabel 'data rate (Mb/s)';
set ylabel 'delay (usec)';

plot "Chapter1/Chapter1Figs/ocaml-switch/mirage-perf.txt" \
  using 1:6:5:7 title 'Mirage' with errorbars lt 1,\
  "Chapter1/Chapter1Figs/ocaml-switch/mirage-perf.txt" \
  using 1:6 title '' with lines lt 1, \
  "Chapter1/Chapter1Figs/ocaml-switch/ovs-perf.txt" using 1:6:5:7 title 'OpenVSwitch' \
  with errorbars lt 2,\
  "Chapter1/Chapter1Figs/ocaml-switch/ovs-perf.txt" using 1:6 title '' with line lt 2;

EOF
