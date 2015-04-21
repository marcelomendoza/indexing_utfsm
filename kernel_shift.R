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
kernel_shift <- function(back,kernel,x,y) {
  rows_back <- dim(back)[1]
  cols_back <- dim(back)[2]
  rowsKernel <- dim(kernel)[1]
  colsKernel <- dim(kernel)[2]
  rowInit <- round(x-rowsKernel/2)
  colInit <- round(y-colsKernel/2)
  for (row in 1:rowsKernel) {
    for (col in 1:colsKernel) {
      if ((rowInit+row <= rows_back) & (colInit+col <= cols_back)) {
        back[rowInit+row,colInit+col] <- kernel[row,col] 
      }
    }
  }
  return(back)
}
