#!/bin/sh
#$ -l slot_type=execute,affinity_group=default
#$ -pe mpi 16 

# prepare environment
if [ -f /etc/redhat-release ]; then
  . /usr/share/Modules/init/sh
fi
if [ -f /etc/debian_version ]; then
  . /usr/share/modules/init/sh
fi
module use /shared/bin/opt/modules
module load intel-mpi FDS6

# prepare machine file for mpi
cat "$TMPDIR/machines"
cat "$PE_HOSTFILE"
for i in `seq 1 $PPN`;
do
  uniq $TMPDIR/machines >> $TMPDIR/u_machines
done

# run simulation
echo Run a FDS simulation:
time mpirun -machinefile "$TMPDIR/u_machines" -n 8 -ppn 8 fds example_jobs/circular_burner.fds
