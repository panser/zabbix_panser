#!/bin/sh

glusterfsdir=/home/monline/cloud
#FS=$(cat /proc/mounts |grep gluster|cut -d" " -f2|uniq|head -1)
FS=${1:-$glusterfsdir}

timeout -k 2 20 cat $FS/glusterfs > /dev/null 2>&1
echo $?

