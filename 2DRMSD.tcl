set inputpsf "temp.psf"
set inputdcd "temp.dcd"

set filename "rmsd2d.dat"

source "tempinput.tcl"

mol load psf $inputpsf dcd $inputdcd
set mol [molinfo top]
set nf [molinfo $mol get numframes]
set nf [expr $nf/$interval]
if { $fromidx<0 || $toidx>=$nf } {
	puts " from and to index out of range, should be in [0:$nf] "
	puts " reindex to [0:$nf] "
	set fromidx 0
	set toidx $nf
}
puts " we will do analysis from [expr $fromidx*$interval] to [expr $toidx*$interval] with interval $interval"
set lengthnf [expr $toidx-$fromidx]
puts " this 2D-plot would be a ${lengthnf}x${lengthnf} matrix"

set sela [atomselect top "$selstr"]
set selb [atomselect top "$selstr"]

set aligna [atomselect top "$alignsel"]
set alignb [atomselect top "$alignsel"]

set outDataFile [open $filename w]

#for {set r $firstRes} {$r <= $lastRes} {incr r} {
for {set fa $fromidx} {$fa<$toidx} {incr fa} {
	set tfa [expr $fa*$interval]
	$sela frame $tfa
	$aligna frame $tfa
	for {set fb $fromidx} {$fb<$toidx} {incr fb} {
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


