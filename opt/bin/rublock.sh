#!/bin/sh

echo List generation
/opt/bin/rublupdate.lua

echo Clear the list
cd /opt/etc/runblock
sed -i '/pornhub.com/d' runblock.dnsmasq
sed -i '/youtube.com/d; /googleusercontent.com/d' runblock.dnsmasq
sed -i '/vulkan/d; /wulkan/d; /vulcan/d' runblock.dnsmasq
sed -i '/casino/d; /kasino/d; /azino/d' runblock.dnsmasq
sed -i '/1xbet/d; /betcity/d; /leon/d; /fonbet/d' runblock.dnsmasq
sed -i '/stavka/d; /slot/d; /dosug/d' runblock.dnsmasq

echo Add custom sites
sed -i '$aipset=\/nnm-club.ws\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/gnome-look.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/opendesktop.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/pling.com\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/7-zip.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/reactos.org\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/nextcloud.com\/rublack-dns' runblock.dnsmasq
sed -i '$aipset=\/git.openwrt.org\/rublack-dns' runblock.dnsmasq

echo Add custom ip
sed -i '$a91.108.4.0\/22' runblock.ipset
sed -i '$a91.108.8.0\/22' runblock.ipset
sed -i '$a91.108.12.0\/22' runblock.ipset
sed -i '$a91.108.16.0\/22' runblock.ipset
sed -i '$a91.108.56.0\/22' runblock.ipset
sed -i '$a149.154.160.0\/22' runblock.ipset
sed -i '$a149.154.164.0\/22' runblock.ipset
sed -i '$a149.154.168.0\/22' runblock.ipset
sed -i '$a149.154.172.0\/22' runblock.ipset

echo Add ip to table
ipset flush rublack-dns

for IP in $(cat /opt/etc/runblock/runblock.ipset) ; do
ipset -A rublack-dns $IP
done

echo Restart dnsmasq
killall -q dnsmasq
/usr/sbin/dnsmasq
