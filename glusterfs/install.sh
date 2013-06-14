#!/bin/sh

FS=$(df -h|grep glusterfs|xargs|cut -d" " -f6)
echo "Touch $FS/glusterfs"
touch $FS/glusterfs

ln -svf /opt/zabbix-plugins/zabbix_panser/glusterfs/panser_glusterfs.conf /etc/zabbix/zabbix_agentd.d/
service zabbix-agent restart
