#! /bin/bash

sudo groupadd sysadmin
sudo usermod -aG sysadmin cluster.user

source ../files/users.txt
echo adding $USERS


for USER in $USERS; do

if [ -f /etc/debian_version ]; then
  echo installing user ${USER}
  sudo useradd -d /shared/home/${USER} -s /bin/bash ${USER}
  sudo usermod -aG sysadmin ${USER} 
  mkdir -p /shared/home/${USER}/.ssh
  chown -R ${USER}:${USER} /shared/home/${USER}  
  chmod 700 /shared/home/${USER}/.ssh
  n=KEY_${USER}; echo ${!n} >> /shared/home/${USER}/.ssh/authorized_keys
  chown ${USER}:${USER} /shared/home/${USER}/.ssh/authorized_keys  
  chmod 600 /shared/home/${USER}/.ssh/authorized_keys  
fi

if [ -f /etc/redhat-release ]; then
  echo installing user ${USER}
  sudo useradd -d /shared/home/${USER} -s /bin/bash ${USER}
  sudo usermod -aG sysadmin ${USER} 
  mkdir -p /shared/home/${USER}/.ssh
  chown -R ${USER}:${USER} /shared/home/${USER}  
  chmod 700 /shared/home/${USER}/.ssh
  n=KEY_${USER}; echo ${!n} >> /shared/home/${USER}/.ssh/authorized_keys
  chown ${USER}:${USER} /shared/home/${USER}/.ssh/authorized_keys  
  chmod 600 /shared/home/${USER}/.ssh/authorized_keys  
fi
done
