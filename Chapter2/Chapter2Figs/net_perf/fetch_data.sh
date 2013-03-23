#!/usr/bin/env bash

for device in devices/*.descr; do
  hash=`basename $device | sed -e 's/\.descr//g'`;
  dev_id=`grep "renderGraphs" devices/$hash.descr | sed -n -e "s/.*\"\(.*\)\".*/\1/p"`
  curl networkdashboard.org/line_shaperate/?deviceid=$dev_id > devices/$hash.shaperate;
  curl networkdashboard.org/line_rtt/?deviceid=$dev_id > devices/$hash.rtt;
  curl networkdashboard.org/line_lmrtt/?deviceid=$dev_id > devices/$hash.lmrtt;
  curl "networkdashboard.org/line_bitrate/?graphno=1&deviceid=$dev_id" > devices/$hash.rate1;
  curl "networkdashboard.org/line_bitrate/?graphno=2&deviceid=$dev_id" > devices/$hash.rate2;
done
