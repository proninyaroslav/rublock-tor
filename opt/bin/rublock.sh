#!/bin/sh

echo List Generation
/opt/bin/rublupdate.lua

echo Clear List
cd /opt/etc/runblock
sed -i '/pornhub.com/d' runblock.dnsmasq
sed -i '/youtube.com/d' runblock.dnsmasq
sed -i '/googleusercontent.com/d' runblock.dnsmasq
sed -i '$aipset=\/nnm-club.ws\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/gnome-look.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/opendesktop.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/pling.com\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/7-zip.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/reactos.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/nextcloud.com\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/git.openwrt.org\/rublack-dns' runblock.dnsmasq
sed -i '$a91.108.4.0\/22' runblock.ipset
sed -i '$a91.108.8.0\/22' runblock.ipset
sed -i '$a91.108.12.0\/22' runblock.ipset
sed -i '$a91.108.16.0\/22' runblock.ipset
sed -i '$a91.108.56.0\/22' runblock.ipset
sed -i '$a149.154.160.0\/22' runblock.ipset
sed -i '$a149.154.164.0\/22' runblock.ipset
sed -i '$a149.154.168.0\/22' runblock.ipset
sed -i '$a149.154.172.0\/22' runblock.ipset

echo Add ip
ipset flush rublack-dns

for IP in $(cat /opt/etc/runblock/runblock.ipset) ; do
ipset -A rublack-dns $IP
done

echo Restart dnsmasq
restart_dhcpd
restart_firewall
