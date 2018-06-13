#!/bin/bash

setenforce 0


if [ -f /etc/redhat-release ]; then
# install modules environment through yum
   yum -y install environment-modules.x86_64
   exit 0
fi


if [ -f /etc/debian_version ]; then
   sudo apt-get -y install environment-modules
   #make sure to allow MPI on Ubuntu
   echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
fi
