#!/bin/sh

mkdir -pv /etc/zabbix/zabbix_agentd.d
#######################################################################
###
# GlusterFS
###
FS=$(cat /proc/mounts |grep gluster|cut -d" " -f2|uniq|head -1)
echo "Touch $FS/glusterfs"
touch $FS/glusterfs
touch /glusterfs

ln -svf /opt/zabbix-plugins/zabbix_panser/glusterfs/panser_glusterfs.conf /etc/zabbix/zabbix_agentd.d/

########################################################################
###
# Linux
###
ln -svf /opt/zabbix-plugins/zabbix_panser/linux/panser_linux.conf /etc/zabbix/zabbix_agentd.d/

#######################################################################
###
# iostat_nomanlab
###
ln -svf /opt/zabbix-plugins/zabbix_panser/iostat_nomanlab/panser_iostat_nomanlab.conf /etc/zabbix/zabbix_agentd.d/
sed -i '/iostat_collect.sh/d' /etc/crontab
echo "*/1 * * * * root  sh /opt/zabbix-plugins/zabbix_panser/iostat_nomanlab/bin/iostat_collect.sh /tmp/disk.txt 15 > /dev/null" >> /etc/crontab

#######################################################################
###
# apc_ups_nut
###
ln -svf /opt/zabbix-plugins/zabbix_panser/apc_ups_nut/apc_ups_nut.conf /etc/zabbix/zabbix_agentd.d/

########################################################################
###
# End
###
service zabbix-agent restart
