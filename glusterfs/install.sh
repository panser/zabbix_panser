#!/bin/sh

FS=$(cat /proc/mounts |grep gluster|cut -d" " -f2|uniq)
echo "Touch $FS/glusterfs"
touch $FS/glusterfs

ln -svf /opt/zabbix-plugins/zabbix_panser/glusterfs/panser_glusterfs.conf /etc/zabbix/zabbix_agentd.d/
service zabbix-agent restart
