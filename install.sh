#!/bin/sh

#######################################################################
###
# GlusterFS
###
FS=$(cat /proc/mounts |grep gluster|cut -d" " -f2|uniq|head -1)
echo "Touch $FS/glusterfs"
touch $FS/glusterfs

ln -svf /opt/zabbix-plugins/zabbix_panser/glusterfs/panser_glusterfs.conf /etc/zabbix/zabbix_agentd.d/

########################################################################
###
# Linux
###
ln -svf /opt/zabbix-plugins/zabbix_panser/glusterfs/linux/panser_linux.conf /etc/zabbix/zabbix_agentd.d/

########################################################################
###
# End
###
service zabbix-agent restart
