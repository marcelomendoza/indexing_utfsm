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
pixel_processing <- function(pixel) {
  source('accumulating.R')
  source('differenting.R')
  source('segmenting.R')
  source('erosing.R')
  source('masking.R')
  #barplot(pixel, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  #title(main="Velocity Spectra for a PP Pixel",sub="Perseus 13CO emission in L1448")
  #box()
  #Sys.sleep(0.5)
  #dev.off()
  print("... spectral processing (accumulating)...")
  h <- accumulating(pixel)
  #barplot(h, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  #title(main="Accumulated Vel Spectra for a PP Pixel",sub="Perseus 13CO emission in L1448")
  #box()
  #Sys.sleep(0.5)
  #dev.off()
  print("... spectral processing (differenting)...")
  diff <- differenting(h)
  #barplot(diff, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  #title(main="Differenced Vel Spectra for a PP Pixel",sub="Perseus 13CO emission in L1448")
  #box()
  #Sys.sleep(0.5)
  #dev.off()
  print("... spectral processing (segmenting)...")
  boxing <- segmenting(diff)
  #barplot(boxing, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  #title(main="Segmented Vel Spectra for a PP Pixel",sub="Perseus 13CO emission in L1448")
  #box()
  #Sys.sleep(0.3)
  #dev.off()
  print("... spectral processing (erosing)...")
  boxing <- erosing(boxing)
  pixel_masked <- masking(boxing,pixel)
  #barplot(pixel_masked, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  #title(main="Filtered Vel Spectra for a PP Pixel",sub="Perseus 13CO emission in L1448")
  #box()
  #Sys.sleep(0.5)
  #dev.off()
  print("... spectral processing (masking)...")
  return(pixel_masked)
}
