#!/usr/bin/env python

import json

fd = open("devices.txt")

dat = json.load(fd)
type = []
for data in dat:
  if data["dev_type"] == "device":
#    type.append(data["dev_type"])
    print "%s %s %s \"%s\""%(data["hash"], data["lon"], data["lat"], data["isp"])
#  print json.dumps(data)


