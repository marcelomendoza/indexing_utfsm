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
kernelsmooth <- function(x, kern, norm=TRUE) {
  # library(ptw)
  # how many rows/cols of zeroes are used to pad.
  width <- dim(kern)[1]
  pad <- floor(width / 2)
  
  # record the width and height the input data matrix
  x_w <- ncol(x)
  x_h <- nrow(x)
  
  # Are we normalizing the kernel?
  if (norm == TRUE) {
    k <- kern / sum(abs(kern))
  } else {
    k <- kern
  }
  
  # pad all around the matrix an equal width of zeros
  x_pad <- t(padzeros(data=x, nzeros=pad, side="both"))
  x_pad <- t(padzeros(data=x_pad, nzeros=pad, side="both"))
  
  # Pre-allocate the final (smoothed) data matrix
  s <- matrix(0, nrow = x_h, ncol = x_w)
  
  # Pre-allocate a temporary matrix for the iterative calculations
  temp <- matrix(0, width, width)
  
  # Loop through the data to apply the kernel.
  for (col in 1:x_w ) {
    for (row in 1:x_h ) {
      temp <- x_pad[row:(row + width - 1), col:(col + width - 1)]
      s[row,col] <-  sum(k * temp)
    }
  }
  
  # return the smoothed data
  return(s)
}
