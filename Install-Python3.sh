#!/bin/bash
green='\e[1;32m' # green
red='\e[1;31m' # red
blue='\e[1;34m' # blue  
nc='\e[0m' # normal
cat << EOF
=========================================================================
 _____         _       
|   __|_ _ ___| |_ _ _ 
|   __| | |   | '_| | |
|__|  |___|_|_|_,_|_  |
                  |___|
=========================================================================
Mr.Funky Auto Install Python3.6.5 for CENTOS\REHL 6/7 
=========================================================================
Author: Mr Funky <QQ:708863861>
=========================================================================
USER: $USER   HOST: $HOSTNAME  KERNEL: `uname -r`  
DISK :`ls  /dev/sd?`
Are you sure to auto install Python3.6 Environment ?
EOF

read -p "Please input Y to continue" key
if [ $key == 'Y' -o $key == 'y' ];then
	echo -n "Install Development Tools.."
	yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc wget make xz &> /dev/null && echo -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo -n "Downloading Python3.6.5...."
	wget http://mirrors.sohu.com/python/3.6.5/Python-3.6.5.tar.xz &> /dev/null && echo  -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo -n "Unziping Packages...."
	xz -d Python-3.6.5.tar.xz &> /dev/null 
	tar xf Python-3.6.5.tar -C /usr/local/src/ &> /dev/null && echo  -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo -n "Configure..."
	cd /usr/local/src/Python-3.6.5/
		./configure --prefix=/usr/local/python3.6.5 &> /dev/null && echo  -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo -n "Compile....."
	make -j 8 &> /dev/null && echo  -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo -n "Install....."
	make install &> /dev/null && echo  -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo -n "Linking....."
	ln -s /usr/local/python3.6.5/bin/pip3  /usr/bin/pip3
	ln -s /usr/local/python3.6.5/bin/python3.6 /usr/bin/python3 &> /dev/null && echo  -e   "[${green}Success${nc}]" || echo -e "[${red}Failed${nc}]"
	echo "PATH=/usr/local/python3.6.5/bin/:\$PATH " >> /etc/profile
	echo "PYTHONPATH=/usr/local/python3.6.5/lib/python3.6/:/usr/local/python3.6.5/lib/python3.6/site-packages/" >> /etc/profile
	source /etc/profile
	V3=`python3 -V | awk '{print $2}'`
	echo "Python Version: $V3 "
	echo "You can input \"python3\" to enter python 3.6.5 and input \"pip3\" to manage your python3 packages."
fi

