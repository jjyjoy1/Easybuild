#!/bin/bash


module load Easybuild/4.15.1

#CFGS=/home/jjy4/bin/EasyBuild/4.5.1/easybuild/easyconfigs
CFGS="To/Easybuild/easyconfigs/dir"
#dbfile='f/foss/foss-2021b.eb'

#Collect the uninstall module files, as example for foss-2021b.eb, which contains long tools chain
eb $CFGS/f/foss/foss-2021b.eb -D --modules-tool EnvironmentModules --module-syntax Tcl --installpath-software /home/jjy4/bin/ --installpath-modules /home/jjy4/bin/Modulefiles/ --allow-modules-tool-mismatch | grep 'module' | grep -ivw 'x' | awk '{print $4}' > foss2021b.txt

#Using easybuild to install foss compiler, the latest version 2021b
for f in $(cat foss2021b.txt); do eb --modules-tool EnvironmentModules --module-syntax Tcl --installpath-software /home/jjy4/bin/ --installpath-modules /home/jjy4/bin/Modulefiles/ --allow-modules-tool-mismatch; done

