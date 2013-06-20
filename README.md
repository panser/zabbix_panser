#zabbix_panser
##Introduction
Zabbix templates by panser

##Install
<pre>
<code>
# mkdir -pv /opt/zabbix-plugins; cd /opt/zabbix-plugins
# git clone https://github.com/panser/zabbix_panser.git
# sh /opt/zabbix-plugins/zabbix_panser/install.sh
</code>
</pre>

##Git Pull
<pre>
<code>
# WCOLL=/etc/pdsh/groups/all pdsh -l root "(cd /opt/zabbix-plugins/zabbix_panser; git pull)"
# WCOLL=/etc/pdsh/groups/all pdsh -l root sh /opt/zabbix-plugins/zabbix_panser/install.sh
</code>
</pre>
