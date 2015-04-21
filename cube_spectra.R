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
cube_spectra <- function(cube,b){
  source('pixel_processing.R')
  source('gaussian_mix.R')
  dims <- dim(cube)
  P_x <- dims[1]
  P_y <- dims[2]
  slices <- dims[3]
  spectra <- array(0.0, dim=c(slices))
  for (i in 1:b) {
    x_ <- sample(1:P_x,1)
    y_ <- sample(1:P_y,1)
    pixel <- cube[x_,y_,]
    pixel_masked <- pixel_processing(pixel)
    spectra <- spectra + pixel_masked
  }
  spectra <- pixel_processing(spectra)
  barplot(spectra,xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  title(main="Spectra Sketch (b=500)",sub="Perseus 13CO emission in L1448")
  box()
  Sys.sleep(1)
  dev.off()
  print("... spectral sketching ...")
  return(spectra)
}
