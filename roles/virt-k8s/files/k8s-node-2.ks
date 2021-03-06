#platform=x86, AMD64, or Intel EM64T
#version=DEVEL
# Install OS instead of upgrade
install
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --iscrypted $1$vZhANTdH$a5juvIOCLLNWs2Xc2UU3v1
# Use network installation
url --url="http://mirror.kakao.com/centos/7/os/x86_64/"
# System language
lang en_US
# System authorization information
auth  --useshadow  --passalgo=sha512
# Use text mode install
text
firstboot --disable
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx

# Firewall configuration
firewall --disabled
# Network information
network  --bootproto=static --device=eth1 --ip=192.168.90.140 --netmask=255.255.255.0
network  --bootproto=static --device=eth0 --gateway=192.168.122.1 --ip=192.168.122.140 --nameserver=8.8.8.8 --netmask=255.255.255.0 --hostname=node-2.example.com
# Reboot after installation
reboot
# System timezone
timezone Asia/Seoul
# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all
# Disk partitioning information
part / --fstype="xfs" --size=20000

%post
hostnamectl set-hostname node-2.example.com

cat <<EOF>> /etc/hosts
192.168.90.110 master-1.example.com master-1
192.168.90.120 utility.example.com utility
192.168.90.130 node-1.example.com node1
192.168.90.140 node-2.example.com node2
EOF
systemctl enable firewalld
%end
