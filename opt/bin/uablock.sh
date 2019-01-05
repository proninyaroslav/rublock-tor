#!/bin/sh

echo Download Lists 
wget -O /opt/etc/runblock/runblock.dnsmasq https://raw.githubusercontent.com/blackcofee/uablock-list/master/urlblock
wget -O /opt/etc/runblock/runblock.ipset https://raw.githubusercontent.com/blackcofee/uablock-list/master/ipblock

echo Generation Block List
cd /opt/etc/runblock
sed -i 's/.*/ipset=\/&\/rublack-dns/' runblock.dnsmasq

echo Restart dnsmasq
ipset flush rublack-dns
restart_dhcpd
restart_firewall
