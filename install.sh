#!/bin/bash
echo "Installing nDPI Debian-packages"
apt-get install unzip libtool autoconf pkg-config subversion libpcap-dev iptables-dev linux-source linux-headers-`uname -r` -y
echo "Switching to src directory"
cd /usr/src

echo "Getting source from GitHub...."
wget https://github.com/betolj/ndpi-netfilter/archive/master.zip .

echo "Unzipping Files...."
unzip master.zip
mv ndpi-netfilter-master master
echo "Finished..."
echo "Changing Directory..."
cd master

echo "Decompiling nDPI tarball"
tar -xvzf nDPI.tar.gz
echo "Finished Decompiling"
cd nDPI
echo  " Compiling, Installing and Configure of code in progress....."
echo "Auto generating script..."
sleep 2
./autogen.sh
echo "Finished generating code..."
sleep 2
echo "Code being made...."
make
echo "Finished"
echo "Install in progress"
make install
echo "Finished make install"
cd ../
NDPI_PATH=/usr/src/master/nDPI make
echo "Installing modules..."
make modules_install
echo "Installation of nDPI complete!!!!!"
cp ipt/libxt_ndpi.so /usr/lib/x86_64-linux-gnu/xtables/

echo "To confirm that ndpi issuccessful installation: iptables -L -m ndpi --help | grep windows | "
iptables -L -m ndpi --help | grep windows


