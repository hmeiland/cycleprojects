# cycleprojects
CycleCloud projects to use in templates

# general
Here are some non-vertical stuff to be used while building a Cycle cluster; for now:

[[[cluster-init general:modules-env:0.1]]]
adds the module-env rpm and creates a directory to store modules: /shared/bin/opt/modules. This dir is also added to the modules environment through a "module use /shared/bin/opt/modules". When creating modules for users, please drop them into this dir...

[[[cluster-init general:intel-mpi:0.1]]]
untar the correct Intel MPI version to be used on the H16r nodes, int the /shared/bin/opt/intel dir; to make it consistent over all nodes. Also a module is added to load the environment to access mpirun and mpiexec with required libs. Just run module load intel-mpi. 

[[[cluster-init general:general:0.1]]]
this is empty, please ignore
