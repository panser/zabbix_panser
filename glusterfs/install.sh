#!/bin/sh

FS=`df -h|grep glusterfs|awk '{print $7}'`
touch $FS/glusterfs

ln -sv /opt/zabbix-plugins/zabbix_panser/glusterfs/panser_glusterfs.conf /etc/zabbix/zabbix_agentd.d/
service zabbix-agent restart
