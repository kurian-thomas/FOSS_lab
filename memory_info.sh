#!/bin/bash
echo "experiment 4"
x=$(uname)
echo "os:$x"
y=$(uname -r)
z=$(uname -a)
echo "kernel: $y"
echo "all info: $z"
echo "more settings"
echo &(lscpu)
echo "memory info"
echo $(free -m)
echo "disk info"
echo $(sudo dmidecode -t memory)
echo "file system"
echo $(sudo fdisk -l)
