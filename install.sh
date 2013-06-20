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
ln -svf /opt/zabbix-plugins/zabbix_panser/linux/panser_linux.conf /etc/zabbix/zabbix_agentd.d/

###
# iostat_nomanlab
###
ln -svf /opt/zabbix-plugins/zabbix_panser/iostat_nomanlab/panser_iostat_nomanlab.conf /etc/zabbix/zabbix_agentd.d/
echo "*/1 * * * * root  sh /opt/zabbix-plugins/zabbix_panser/iostat_nomanlab/bin/iostat_collect.sh /tmp/disk.txt 15 > /dev/null" >> /etc/crontab


########################################################################
###
# End
###
service zabbix-agent restart
