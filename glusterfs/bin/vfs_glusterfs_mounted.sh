#!/bin/sh

FS=$(df -h|grep glusterfs|xargs|cut -d" " -f6)
timeout -k 2 20 cat $FS/glusterfs > /dev/null 2>&1
echo $?
