#!/bin/bash

if [ -f /etc/redhat-release ]; then
sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
sudo yum -y install blobfuse
fi

if [ -f /etc/debian_version ]; then
wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y blobfuse
fi


if [ ! -d /mnt/resource/blobfusetmp ]; then
sudo mkdir -p /mnt/resource/blobfusetmp
fi
sudo chmod 777 /mnt/resource/blobfusetmp

if [ ! -d /etc/blobfuse ]; then
sudo mkdir /etc/blobfuse
fi
sudo cat >/etc/blobfuse/fuse_connection.cfg <<EOF
accountName myaccount
accountKey myaccesskey==
containerName mycontainer
EOF

chmod 755 /etc/blobfuse/fuse_connection.cfg

if [ ! -d /mnt/azurecontainer ]; then
sudo mkdir /mnt/azurecontainer
fi
sudo chmod 777 /mnt/azurecontainer

if [ -f /etc/fuse.conf ]; then
sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf
fi
#blobfuse /mnt/azurecontainer --tmp-path=/mnt/resource/blobfusetmp  --config-file=/etc/blobfuse/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
