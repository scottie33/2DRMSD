#!/bin/bash

if [ $# -lt 8 ]; then
	echo " you should have VMD installed with path set well."
	echo " "
	echo " cmd psffile dcdfile alignsel selstr startframe interval intnanosec skipped(e.g. the first 5 secs are not taken into consideration)"
	echo " "
	echo " example: "
	echo " ./2DRMSD.bash ../telk_ionized.psf all.dcd \"(protein and backbone) or (nucleic and backbone)\" \"(protein and backbone) or (nucleic and backbone)\" 5 4 10 5"
	echo " "
	echo " please try again."
	exit -1
fi

#### generating tempinput.tcl here ####
echo  "set inputpsf \"$1\" " > tempinput.tcl
echo  "set inputdcd \"$2\" " >> tempinput.tcl
echo  "set alignsel \"$3\" " >> tempinput.tcl
echo  "set selstr \"$4\" " >> tempinput.tcl
echo  "set startf $5 " >> tempinput.tcl
echo  "set interval $6 " >> tempinput.tcl
echo  "set intnanosec $7 " >> tempinput.tcl
echo  "set skipped $8 " >> tempinput.tcl
#######################################

vmd -dispdev text -e 2DRMSD.tcl

gnuplot plot.gpl

exit 0

