#!/bin/bash

if [ -f /etc/redhat-release ]; then
sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
sudo yum -y install blobfuse
fi

if [ -f /etc/debian_version ]; then
#wget http://security.ubuntu.com/ubuntu/pool/main/g/gnutls26/libgnutls26_2.12.23-12ubuntu2.8_amd64.deb
#wget http://security.ubuntu.com/ubuntu/pool/main/libg/libgcrypt11/libgcrypt11_1.5.3-2ubuntu4.5_amd64.deb
wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
#sudo dpkg -i libgnutls26_2.12.23-12ubuntu2.8_amd64.deb libgcrypt11_1.5.3-2ubuntu4.5_amd64.deb
sudo apt-get update
sudo apt-get install -y blobfuse
fi


sudo mkdir -p /mnt/resource/blobfusetmp
sudo chmod 777 /mnt/resource/blobfusetmp

sudo mkdir /etc/blobfuse
sudo cat >/etc/blobfuse/fuse_connection.cfg <<EOF
accountName myaccount
accountKey myaccesskey==
containerName mycontainer
EOF

chmod 755 /etc/blobfuse/fuse_connection.cfg

sudo mkdir /mnt/azurecontainer
sudo chmod 777 /mnt/azurecontainer

#blobfuse /mnt/azurecontainer --tmp-path=/mnt/resource/blobfusetmp  --config-file=/etc/blobfuse/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
