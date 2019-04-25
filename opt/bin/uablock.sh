#!/bin/sh

echo Download Lists 
wget -O /opt/etc/runblock/runblock.dnsmasq https://raw.githubusercontent.com/blackcofee/uablock-list/master/urlblock
wget -O /opt/etc/runblock/runblock.ipset https://raw.githubusercontent.com/blackcofee/uablock-list/master/ipblock

echo Generation Block List
cd /opt/etc/runblock
sed -i 's/.*/ipset=\/&\/rublack-dns/' runblock.dnsmasq

echo Add ip
ipset flush rublack-dns

for IP in $(cat /opt/etc/runblock/runblock.ipset) ; do
ipset -A rublack-dns $IP
done

echo Restart dnsmasq
killall -q dnsmasq
/usr/sbin/dnsmasq
