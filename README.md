* 2DRMSD
*** Currently only the trajectories formatted in .dcd are supported.

===

example 1 to usage:

	./2DRMSD.bash ../telk_ionized.psf all.dcd \"(protein and backbone) or (nucleic and backbone)\" \"(protein and backbone) or (nucleic and backbone)\" 5 4 10 5

	use the 1st string in quotes to align the selected group of atoms, and then do the 2drmsd calculation with respect to the 2nd string in quotes,
        starting from the 5-th frame,
        skipping interval will be 4 frames, 
	with interval equal to every 10 frames,
        the firt five frames will not be considered in coordinating the graph.

===

===
