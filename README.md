#zabbix_panser
##Introduction
Zabbix templates by panser

##Install
<pre>
<code>
# pdsh -w $HOSTNAME -l root "(cd /opt/zabbix-plugins/zabbix_panser; git clone https://github.com/panser/zabbix_panser.git)"
# pdsh -w $HOSTNAME -l root sh /opt/zabbix-plugins/zabbix_panser/install.sh
</code>
</pre>

##Git Pull
<pre>
<code>
# WCOLL=/etc/pdsh/groups/all pdsh -l root "(cd /opt/zabbix-plugins/zabbix_panser; git pull)"
# WCOLL=/etc/pdsh/groups/all pdsh -l root sh /opt/zabbix-plugins/zabbix_panser/install.sh
</code>
</pre>
