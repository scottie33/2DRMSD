#!/bin/bash

if [ $# -lt 3 ]; then
	echo " you should have VMD installed with path set well."
	echo " "
	echo " cmd psffile dcdfile alignsel selstr interval"
	echo " "
	echo " please try again."
	exit -1
fi

#### generating tempinput.tcl here ####
echo  "set inputpsf \"$1\" " > tempinput.tcl
echo  "set inputdcd \"$2\" " >> tempinput.tcl
echo  "set alignsel \"$3\" " >> tempinput.tcl
echo  "set selstr \"$4\" " >> tempinput.tcl
echo  "set interval $5 " >> tempinput.tcl
#######################################

vmd -dispdev text -e 2DRMSD.tcl

gnuplot plot.gpl

exit 0

