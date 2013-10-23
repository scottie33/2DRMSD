#!/bin/bash

if [ $# -lt 5 ]; then
	echo " you should have VMD installed with path set well."
	echo " "
	echo " cmd psffile dcdfile alignsel selstr interval [fromidx toidx]"
	echo " "
	echo " [ * fromidx and toidx are actually the index divided by interval. ]"
	echo " please try again."
	exit -1
fi

#### generating tempinput.tcl here ####
echo  "set inputpsf \"$1\" " > tempinput.tcl
echo  "set inputdcd \"$2\" " >> tempinput.tcl
echo  "set alignsel \"$3\" " >> tempinput.tcl
echo  "set selstr \"$4\" " >> tempinput.tcl
echo  "set interval $5 " >> tempinput.tcl
if [ $# -gt 5 ]; then 
	echo  "set fromidx $6 " >> tempinput.tcl
	echo  "set toidx $7 " >> tempinput.tcl
else
	echo  "set fromidx -1 " >> tempinput.tcl
	echo  "set toidx -1 " >> tempinput.tcl
fi
#######################################

vmd -dispdev text -e 2DRMSD.tcl

gnuplot plot.gpl

exit 0

