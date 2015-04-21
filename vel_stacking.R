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
vel_stacking <- function(Z,slices_min,slices_max) {
  dims <- dim(Z)
  P_x <- dims[1]
  P_y <- dims[2]
  h <- array(0.0, dim=c(P_x,P_y))
  #only for visualization
  for (i in slices_min:slices_max) {
    image(Z[,,i],col=topo.colors(256), xlab="Galactic Longitude 20 -20 alpha (arcmin)", ylab="Galactic Latitude -20 20 delta (arcmin)", axes=FALSE)
    title(main="PP Slice",sub="Perseus 13CO emission in L1448")
    box()
    Sys.sleep(1)
    dev.off()
    print("... slicing ...")
  }
  #stacking
  print("... stacking ...")
  for (i in 1:P_x) {
    for (j in 1:P_y) {
      h[i,j] <- sum(Z[i,j,slices_min:slices_max], na.rm=TRUE)
    }
    image(h,col=topo.colors(256), xlab="Galactic Longitude 20 -20 alpha (arcmin)", ylab="Galactic Latitude -20 20 delta (arcmin)", axes=FALSE)
    title(main="PP Projection",sub="Perseus 13CO emission in L1448")
    box()
    Sys.sleep(0.5)
    dev.off()
  }
  Sys.sleep(1)
  #dev.off()
  h <- (h-min(h,na.rm=TRUE))/(max(h,na.rm=TRUE)-min(h,na.rm=TRUE))
  image(h,col=topo.colors(256), xlab="Galactic Longitude 20 -20 alpha (arcmin)", ylab="Galactic Latitude -20 20 delta (arcmin)", axes=FALSE)
  #barplot(h, xlab="Velocity Range 40 [km s^-1]", axes=FALSE)
  title(main="PP Projection",sub="Perseus 13CO emission in L1448")
  box()
  return(h)
}
