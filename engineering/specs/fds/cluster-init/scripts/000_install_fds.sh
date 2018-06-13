#!/bin/bash

#sudo chmod +x ../files/FDS_6.6.0-SMV_6.6.0_linux64.sh 
#sudo sh ../files/FDS_6.6.0-SMV_6.6.0_linux64.sh y

#download FDS
wget https://github.com/firemodels/fds/releases/download/FDS6.6.0/FDS_6.6.0-SMV_6.6.0_linux64.sh
if [ ! -f FDS_6.6.0-SMV_6.6.0_linux64.sh ]; then 
   # download failed
   exit 1
fi
sudo bash FDS_6.6.0-SMV_6.6.0_linux64.sh y
sudo mv /root/FDS /shared/bin/opt/
rm -rf FDS_6.6.0-SMV_6.6.0_linux64.sh

#copy module file 
cp ../files/FDS6 /shared/bin/opt/modules/
