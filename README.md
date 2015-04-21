Indexación de objetos astronómicos
==============

Código en R

- cube_indexing.R runs the full pipeline of the system. 

It has dependences on EBImage, FITSio, ptw, and R. 

Source codes are organized as follows:

- Spectra processing codes are in the following files: accumulating.R, cube_spectra.R, differenting.R, erosing.R, masking.R, pixel_processing.R, reading_cubes.R, segmenting.R, stacking.R, and vel_stacking.R

- Multiscale segmentation codes are in the following files: gaussian_mix.R, bg_fg.R, optimal_w.R, kernelsmooth.R, kernel_shift.R

- Indexing codes (to deal with a relational database): mainFunction.R (runs the indexing pipeline), getObjects.R, getCoordData.R, calculateCoords.R, and writeToDataBase.R


Examples.
1. ROI detection:



2. Indexing:

# Dependences on DBI and RPostgreSQL 

R> drv <- dbDriver("PostgreSQL")

R> database <- dbConnect(drv, dbname="alma", user="postgres", password=" ")

R> fits <- "http://das.sdss.org/www/cgi-bin/drC?RUN=3630&RERUN=40&CAMCOL=3&FIELD=83&FILTER=r"

R> mainFunction(database,fits)

@Marcelo Mendoza (21/4/15)
