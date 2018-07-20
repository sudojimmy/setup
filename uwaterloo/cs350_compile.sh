#!/bin/bash

set -e

:'
Put `alias os=$(pwd)/cs350_compile.sh` to start script.

Use `os X X` command to configure and build ASST X
Use `os X` command to build ASST X
Use `os` command to simply run current kernal
'

if [ ${#} -eq 0 ] ; then
	cd $HOME/cs350-os161/root/
	sys161 kernel
	exit
elif [ ${#} -eq 2 ] ; then
	cd $HOME/cs350-os161/os161-1.99/kern/conf
	./config ASST$1
	cd ../compile/ASST$1
	bmake depend
	bmake
	bmake install
	echo
	echo "========== SUCCESS: configure and build ASST$1 =========="
	echo
else
	cd $HOME/cs350-os161/os161-1.99/kern/compile/ASST$1
	bmake depend
	bmake
	bmake install
	cd $HOME/cs350-os161/root/
	echo
	echo "========== SUCCESS: build ASST$1 ==========="
	echo
	sys161 kernel-ASST$1
fi
