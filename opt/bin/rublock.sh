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
sed -i '$a91.108.4.0\/22' rublock.ipset
sed -i '$a91.108.8.0\/22' rublock.ipset
sed -i '$a91.108.12.0\/22' rublock.ipset
sed -i '$a91.108.16.0\/22' rublock.ipset
sed -i '$a91.108.56.0\/22' rublock.ipset
sed -i '$a149.154.160.0\/22' rublock.ipset
sed -i '$a149.154.164.0\/22' rublock.ipset
sed -i '$a149.154.168.0\/22' rublock.ipset
sed -i '$a149.154.172.0\/22' rublock.ipset

echo Restart dnsmasq
restart_dhcpd
restart_firewall