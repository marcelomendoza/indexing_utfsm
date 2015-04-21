#This file is part of ChiVO, the Chilean Virtual Observatory
#A project sponsored by FONDEF (D11I1060)
#Copyright (C) 2015 Universidad Tecnica Federico Santa Maria Mauricio Solar
#                                                            Marcelo Mendoza
#                   Universidad de Chile                     Diego Mardones
#                   Pontificia Universidad Catolica          Karim Pichara
#                   Universidad de Concepcion                Ricardo Contreras
#                   Universidad de Santiago                  Victor Parada
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#
library(EBImage)
library(FITSio)
source('cube_spectra.R')
z <- file(description="PerA_13co_FCRAO_xyv_smooth_v2.fits", open="rb")
header <- readFITSheader(z)
D <- readFITSarray(z, header)
close(z)
Z <- D$imDat
Z_block <- Z[300:440,65:135,]
spectra <- cube_spectra(Z_block,50)
h1 <- vel_stacking(Z_block,67,96)
h2 <- vel_stacking(Z_block,105,148)
image(h1,col=topo.colors(256), xlab="Galactic Longitude 20 -20 alpha (arcmin)", ylab="Galactic Latitude -20 20 delta (arcmin)", axes=FALSE)
#barplot(h, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
title(main="PP Projection at 0.25 - 2.25 km s^-1",sub="Perseus 13CO emission in L1448")
box()
gaussian_mix(h1)
image(h2,col=topo.colors(256), xlab="Galactic Longitude 20 -20 alpha (arcmin)", ylab="Galactic Latitude -20 20 delta (arcmin)", axes=FALSE)
#barplot(h, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
title(main="PP Projection at 3.25 - 5.75 km s^-1",sub="Perseus 13CO emission in L1448")
box()
gaussian_mix(h2)
