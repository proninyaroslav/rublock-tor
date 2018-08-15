#!/bin/sh

echo List Generation
/opt/bin/rublupdate.lua

echo Clear List
cd /opt/etc/runblock
sed -i '/pornhub.com/d' runblock.dnsmasq
sed -i '/youtube.com/d' runblock.dnsmasq
sed -i '/googleusercontent.com/d' runblock.dnsmasq
sed -i '$aipset=\/nnm-club.ws\/rublock' runblock.dnsmasq
sed -i '$aipset=\/gnome-look.org\/rublock' runblock.dnsmasq
sed -i '$aipset=\/opendesktop.org\/rublock' runblock.dnsmasq
sed -i '$aipset=\/pling.com\/rublock' runblock.dnsmasq
sed -i '$a52.77.181.198' runblock.ipset
sed -i '$a54.229.110.205' runblock.ipset
sed -i '$a18.205.93.0\/25' runblock.ipset

echo Restart dnsmasq
killall -sighup dnsmasq