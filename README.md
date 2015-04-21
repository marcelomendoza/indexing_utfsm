Indexación de objetos astronómicos
==============

Código en R

cube_indexing.R runs the full pipeline of the system. 
It has dependences on EBImage, FITSio, ptw, and R. 

Source codes are organized as follows:

Spectra processing codes are in the following files:

accumulating.R, cube_spectra.R, differenting.R, erosing.R, masking.R, pixel_processing.R, reading_cubes.R, segmenting.R, stacking.R, and vel_stacking.R

Multiscale segmentation codes are in the following files:

gaussian_mix.R, bg_fg.R, optimal_w.R, kernelsmooth.R, kernel_shift.R

Indexing codes (to deal with a relational database):

- mainFunction.R: runs the indexing pipeline.

indexing codes are in tje following files:
 mainFunction.R, 

@Marcelo Mendoza (21/4/15)
