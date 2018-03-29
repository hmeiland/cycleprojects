#!/bin/bash

mkdir -p /shared/bin/opt/modules

echo "module use /shared/bin/opt/modules" >> /etc/profile.d/modules.sh
echo "module use /shared/bin/opt/modules" >> /etc/profile.d/modules.csh


