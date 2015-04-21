Indexación de objetos astronómicos
==============

Código en R

cube_indexing.R runs the full pipeline of the system. 
It has dependences on EBImage, FITSio, and R. 

Source codes are organized as follows:

Spectra processing codes are:

. accumulating.R, cube_spectra.R, differenting.R, erosing.R, masking.R, pixel_processing.R, reading_cubes.R, segmenting.R, stacking.R, and vel_stacking.R

Multiscale segmentation codes are in multiscale.
Indexing codes (to deal with a relational database) are in indexing.

Old codes are in get_objects, including image segmentation scripts.

@Marcelo Mendoza (21/4/15)
