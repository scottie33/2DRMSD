set inputpsf "temp.psf"
set inputdcd "temp.dcd"

set filename "rmsd2d.dat"

source "tempinput.tcl"

mol load psf $inputpsf dcd $inputdcd
set mol [molinfo top]
set nf [molinfo $mol get numframes]
set nf [expr $nf/$interval]
puts " this 2D-plot would be a ${nf}x${nf} matrix"

set sela [atomselect top "$selstr"]
set selb [atomselect top "$selstr"]

set aligna [atomselect top "$alignsel"]
set alignb [atomselect top "$alignsel"]

set outDataFile [open $filename w]

#for {set r $firstRes} {$r <= $lastRes} {incr r} {
for {set fa 0} {$fa<$nf} {incr fa} {
	set tfa [expr $fa*$interval]
	$sela frame $tfa
	$aligna frame $tfa
	for {set fb 0} {$fb<$nf} {incr fb} {
		set tfb [expr $fb*$interval]
		$selb frame $tfb
		$alignb frame $tfb
		#display update
		#set val 
		#set resid $r
		set trans_mat [measure fit $alignb $aligna]
		$selb move $trans_mat
		puts $outDataFile "$fa $fb [measure rmsd $sela $selb]"
		#puts $outDataFile "$fa $fb [measure rmsd $sela $selb weight mass]"
	}
	puts $outDataFile " "
}

close $outDataFile

set temprangefn [open "temp.gpl" w]
puts $temprangefn "xtran=$nf"
puts $temprangefn "ytran=$nf"
close $temprangefn

quit


