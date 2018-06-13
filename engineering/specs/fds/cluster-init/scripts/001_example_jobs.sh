#!/bin/bash

mkdir -p /shared/home/cluster.user/example_jobs
chown cluster.user:cluster.user /shared/home/cluster.user/example_jobs
cp ../files/fdsjob* /shared/home/cluster.user/example_jobs/
cp /shared/bin/opt/FDS/FDS6/Examples/Fires/circular_burner.fds /shared/home/cluster.user/example_jobs/
