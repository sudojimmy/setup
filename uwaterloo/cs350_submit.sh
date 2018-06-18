#!/bin/bash

if [ ${#} -eq 0 ] ; then
	echo
	echo "ERROR: need argument to specify which assignment to submit, abort."
	echo
	exit
fi

cd $HOME/cs350-os161
/u/cs350/bin/cs350_submit $1
rm os161kern.tgz
