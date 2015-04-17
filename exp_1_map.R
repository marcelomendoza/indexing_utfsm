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
exp_1_map <- function(wMax, bMax, offset){
  output <- array(0, dim=c(bMax,wMax))
  for (i in 2:bMax) {
    for (j in 2:wMax) {
      output[i,j] <- experimento_1(i,j,offset);
    }
  }
  i <- 1 #no brush
  for (j in 2:wMax) {
    x <- thresh(nuc, j, j, offset)
    x <- bwlabel(x)
    output[i,j] <- max(x)
  }
  j <- 1 #no thresh
  for (i in 2:bMax) {
    x = opening(nuc, makeBrush(i, shape='disc'))
    x <- bwlabel(x)
    output[i,j] <- max(x)
  }
  output[1,1] <- output[2,1]
  return(output)
}

# output_offset_0 <- exp_1_map(40,60,0)
# abs_error_offset_0 <- abs(output_offset_0-76)
# abs_error_offset_0_log <- log(abs_error_offset_0+1)
# x <- seq(1,40, by=1)
# y <- seq(1,60, by=1)
# filled.contour(x,y,abs_error_offset_0_log,nlevels=25,color.palette=topo.colors, xlab="window width (in pixels)", ylab="disc radius (in pixels)", main="Log Absolute Error")
