===

example 1 to usage:

	./2DRMSD.bash yours.psf yours.dcd "nucleic and backbone noh" "(nucleic or protein) and noh" 10

	use the 1st string in quotes to align the selected group of atoms referred to by the 2nd string in quotes, 
	with interval equal to every 10 frames.

===

example 2 to usage:

	./2DRMSD.bash ../telk_ionized.psf all.dcd "nucleic and backbone noh" "(nucleic or protein) and noh" 10 23 80

	use the 1st string in quotes to align the selected group of atoms referred to by the 2nd string in quotes, 
	with interval equal to every 10 frames. 
	The calculation will be implemented from the 230 (23*10) to the 800 (80*10) -th frame.

===