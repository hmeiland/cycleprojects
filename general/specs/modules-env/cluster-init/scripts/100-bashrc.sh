#!/bin/bash


if [ -d /shared/bin ]; then
  mkdir -p /shared/bin/opt/modules
fi

echo "source /etc/profile.d/modules.sh" >> /etc/bashrc

echo "module use /shared/bin/opt/modules" >> /etc/profile.d/modules.sh
echo "module use /shared/bin/opt/modules" >> /etc/profile.d/modules.csh

if [ -f /etc/redhat-release ]; then
# this should fix using bash in SGE, not much luck though; sticking with sh submit scripts...
    sed '/export -f module/s/.*/#export -f module/' /usr/share/Modules/init/bash
fi

exit 0
