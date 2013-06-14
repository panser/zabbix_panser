#!/bin/sh

FS=$(cat /proc/mounts |grep gluster|cut -d" " -f2|uniq|head -1)
timeout -k 2 20 cat $FS/glusterfs > /dev/null 2>&1
echo $?
